"""Compile the sample with XeLaTeX and LuaLaTeX and smoke-check APA output."""
from pathlib import Path
import re
import subprocess
import unicodedata

ROOT = Path(__file__).resolve().parents[1]


def main():
    for engine in ("xelatex", "lualatex"):
        out = ROOT / "build" / engine
        out.mkdir(parents=True, exist_ok=True)
        result = subprocess.run(
            ["latexmk", "-" + engine, "-outdir=" + str(out),
             "-interaction=nonstopmode", "-halt-on-error",
             "LaTex-Article-template-KO.tex"], cwd=ROOT,
            stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
        )
        if result.returncode:
            raise SystemExit(result.stdout.decode("utf-8", errors="replace"))
        pdf = out / "LaTex-Article-template-KO.pdf"
        raw = subprocess.check_output(["pdftotext", "-layout", str(pdf), "-"], cwd=ROOT)
        raw_text = unicodedata.normalize("NFKC", raw.decode("utf-8"))
        raw_text = re.sub(r"(?m)^[ \t]*\d+[ \t]+", "", raw_text)
        text = re.sub(r"\s+", " ", raw_text)
        text = text.replace("\u037e", ";")
        for expected in (
            "(Baker & Brown, 2002)",
            "(Adams, 2001; Baker & Brown, 2002; Carter et al., 2003; Davis et al., 2004)",
            "Foster, F., Grant, G., Hill, H., Irwin, I., Jones, J., & King, K. (2006).",
            "Garcia, G., Harris, H., Ito, I., James, J., Khan, K., Lewis, L., & Miller, M. (2007).",
            "Harris, H., Irwin, I., Jones, J., King, K., Lee, L., Moore, M., Nolan, N., & Owens, O. (2008).",
            "Smith, J., Jr. (2010).",
            "Example Research Group. (2000).",
        ):
            if expected not in text:
                raise SystemExit(f"{engine}: expected APA output missing: {expected}")
        print(f"PASS {engine}: compiled PDF and APA 7 citation/reference checks")


if __name__ == "__main__":
    main()
