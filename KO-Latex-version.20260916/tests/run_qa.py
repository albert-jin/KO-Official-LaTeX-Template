"""Build and verify the template. Run from any directory with Python 3."""
from pathlib import Path
import os
import re
import subprocess
import unicodedata

ROOT = Path(__file__).resolve().parents[1]
ENV = dict(os.environ, LC_ALL="C", LANG="C")


def run(args, output):
    result = subprocess.run(args, cwd=ROOT, env=ENV, stdout=subprocess.PIPE,
                            stderr=subprocess.STDOUT)
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_bytes(result.stdout)
    return result.returncode


def pdf_text(path):
    raw = subprocess.check_output(["pdftotext", "-layout", str(path), "-"], cwd=ROOT)
    return re.sub(r"\s+", " ", unicodedata.normalize("NFKC", raw.decode("utf-8")))


def verify_references(text):
    expected = [
        "One: (Alpha, 2001). Two: (Bravo and Brown, 2002).",
        "Three: (Charlie et al., 2003). Four: (Delta et al., 2004).",
        "Shuffled: (Alpha, 2001; Bravo and Brown, 2002; Charlie et al., 2003; Delta et al., 2004).",
        "Sixfirst A, Sixtwo B, Sixthree C, Sixfour D, Sixfive E, Sixlast F. Six authors fixture.",
        "Sevenfirst A, Seventwo B, Seventhree C, Sevenfour D, Sevenfive E, Sixkeep F, et al.",
        "Smith J. Book fixture. Example Press: London. 2010.",
        "Dupont J-P. Chapter fixture. In: Smith J Jr., van Beethoven L eds.",
        "Collected QA essays. Pp. 21–35. Example Press: Paris. 2011.",
        "de la Cruz J. Example Research Institute, assignee. Patent fixture. United States US0000000B1. 8 August 2000.",
        "García Márquez J. Accent fixture.",
        "World Health Organization. Website fixture. 2000. Available at: https://example.org/ (Accessed: 8 August 2000).",
        "Undated website fixture. Available at: https://example.org/undated (Accessed: 16 September 2026).",
        "张三, 李四. Chinese names fixture.",
    ]
    for fragment in expected:
        assert fragment in text, "Missing output: " + fragment
    assert "Omitseven" not in text, "Seventh author should be omitted"


def build(engine, source, directory, check_refs=False):
    out = ROOT / "build" / directory
    out.mkdir(parents=True, exist_ok=True)
    stem = Path(source).stem
    code = run(["latexmk", "-" + engine, "-outdir=" + str(out),
                "-interaction=nonstopmode", "-halt-on-error", source], out / "console.txt")
    assert code == 0, "Build failed: " + str(out / "console.txt")
    log = (out / (stem + ".log")).read_text(encoding="utf-8", errors="replace")
    for problem in ["Missing character:", "There were undefined references",
                    "Please (re)run Biber", "Overfull ", "LaTeX Error:"]:
        assert problem not in log, directory + ": " + problem
    assert not re.search(r"Citation .+ undefined", log), directory + ": undefined citation"
    text = pdf_text(out / (stem + ".pdf"))
    if check_refs:
        verify_references(text)
    else:
        for field in ["Running title:", "Word count (main text):", "Word count (abstract):",
                      "Figures / Tables:", "Correspondence:", "optional, but recommended"]:
            assert field in text, "Missing cover field: " + field
    print("PASS " + directory, flush=True)


def diagnostic(engine, fixture, expected, should_fail):
    out = ROOT / "build" / (engine + "-" + fixture)
    out.mkdir(parents=True, exist_ok=True)
    code = run([engine, "-interaction=nonstopmode", "-halt-on-error",
                "-output-directory=" + str(out), "tests/" + fixture + ".tex"], out / "console.txt")
    assert (code != 0) == should_fail, "Unexpected exit code: " + str(out)
    log = (out / (fixture + ".log")).read_text(encoding="utf-8", errors="replace")
    assert re.sub(r"\s+", "", expected) in re.sub(r"\s+", "", log), "Missing diagnostic: " + expected
    print("PASS " + out.name, flush=True)


if __name__ == "__main__":
    for engine, label in [("xelatex", "xe"), ("lualatex", "lua")]:
        build(engine, "LaTex-Article-template-KO.tex", label)
        build(engine, "tests/references-qa.tex", "qa-" + label, True)
        build(engine, "tests/portable-qa.tex", "portable-" + label, True)
        diagnostic(engine, "missing-font", "KO Nonexistent Font QA unavailable; using TeX Gyre Termes", False)
        diagnostic(engine, "missing-image", "Missing template image:", True)
        diagnostic(engine, "running-title", "Running title exceeds 60 characters", False)
    diagnostic("pdflatex", "references-qa", "Unsupported engine: use XeLaTeX or LuaLaTeX", True)
    print("All QA checks passed.", flush=True)
