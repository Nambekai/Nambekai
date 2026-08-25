"""Validate public profile assets and local references without network access."""

from __future__ import annotations

import re
import sys
import xml.etree.ElementTree as ET
from pathlib import Path
from urllib.parse import unquote


ROOT = Path(__file__).resolve().parents[1]
README = ROOT / "README.md"
REQUIRED_FILES = (
    README,
    ROOT / "assets" / "profile-engineering-banner.png",
    ROOT / "assets" / "profile-avatar.png",
    ROOT / "assets" / "engineering-workflow.svg",
    ROOT / "resume" / "Tran-Si-Nam-Resume.typ",
    ROOT / "resume" / "Tran-Si-Nam-Resume.pdf",
    ROOT / "docs" / "LINKEDIN-PROFILE.md",
    ROOT / "docs" / "ALPR-REPOSITORY-RECOVERY.md",
    ROOT / "projects" / "vietnamese-alpr-yolo-ocr.md",
)


def fail(message: str) -> None:
    print(f"ERROR: {message}", file=sys.stderr)
    raise SystemExit(1)


def validate_required_files() -> None:
    missing = [str(path.relative_to(ROOT)) for path in REQUIRED_FILES if not path.is_file()]
    if missing:
        fail(f"Missing required files: {', '.join(missing)}")


def markdown_targets(text: str) -> set[str]:
    html_targets = re.findall(r'(?:src|href)="([^"]+)"', text)
    markdown_links = re.findall(r"\]\(([^)]+)\)", text)
    return set(html_targets + markdown_links)


def validate_local_references() -> None:
    for markdown in ROOT.rglob("*.md"):
        text = markdown.read_text(encoding="utf-8")
        for target in markdown_targets(text):
            if target.startswith(("http://", "https://", "mailto:", "tel:", "#")):
                continue
            clean_target = unquote(target.split("#", 1)[0].split("?", 1)[0])
            referenced = (markdown.parent / clean_target).resolve()
            if not referenced.exists():
                fail(f"Broken local reference in {markdown.relative_to(ROOT)}: {target}")


def validate_profile_counter() -> None:
    markdown_files = list(ROOT.rglob("*.md"))
    occurrences = {
        path: path.read_text(encoding="utf-8").count("komarev.com/ghpvc")
        for path in markdown_files
    }
    if occurrences.get(README) != 1:
        fail("The root README must contain exactly one profile-view counter.")
    misplaced = [path for path, count in occurrences.items() if path != README and count]
    if misplaced:
        fail("The profile-view counter must not appear outside the root README.")


def validate_svg_files() -> None:
    for svg in ROOT.rglob("*.svg"):
        raw = svg.read_bytes()
        try:
            text = raw.decode("ascii")
        except UnicodeDecodeError as exc:
            fail(f"SVG must contain ASCII English text only: {svg.relative_to(ROOT)} ({exc})")
        if "\ufffd" in text or "????" in text:
            fail(f"SVG contains replacement or placeholder text: {svg.relative_to(ROOT)}")
        if "stroke-dasharray" in text:
            fail(f"SVG contains a dotted or dashed moving-line pattern: {svg.relative_to(ROOT)}")
        try:
            ET.fromstring(text)
        except ET.ParseError as exc:
            fail(f"Invalid SVG XML in {svg.relative_to(ROOT)}: {exc}")


def validate_resume_pdf() -> None:
    pdf = ROOT / "resume" / "Tran-Si-Nam-Resume.pdf"
    if not pdf.read_bytes().startswith(b"%PDF-"):
        fail("The resume PDF is not a valid PDF file.")


def validate_public_contacts() -> None:
    text = README.read_text(encoding="utf-8")
    required = (
        "https://www.linkedin.com/in/nambekai/",
        "mailto:nambekai123@gmail.com",
        "mailto:22207062@student.hcmus.edu.vn",
        "tel:+84915551529",
        "https://github.com/Nambekai",
    )
    missing = [item for item in required if item not in text]
    if missing:
        fail(f"Missing public contact links: {', '.join(missing)}")


def validate_alpr_attribution() -> None:
    current_files = (
        README,
        ROOT / "resume" / "Tran-Si-Nam-Resume.typ",
        ROOT / "docs" / "LINKEDIN-PROFILE.md",
        ROOT / "projects" / "vietnamese-alpr-yolo-ocr.md",
    )
    combined = "\n".join(path.read_text(encoding="utf-8") for path in current_files)
    required = (
        "https://github.com/lhlizdabezt/NhapMonAI",
        "YOLO-format",
        "FFmpeg",
        "team",
    )
    missing = [item for item in required if item not in combined]
    if missing:
        fail(f"Missing verified ALPR attribution evidence: {', '.join(missing)}")

    forbidden = (
        "Co-developed the Python desktop inference",
        "desktop and LAN demo co-development",
        "Maintained repository structure",
        "repository and release packaging |",
    )
    present = [item for item in forbidden if item in combined]
    if present:
        fail(f"Unsupported ALPR attribution remains: {', '.join(present)}")


def main() -> None:
    validate_required_files()
    validate_local_references()
    validate_profile_counter()
    validate_svg_files()
    validate_resume_pdf()
    validate_public_contacts()
    validate_alpr_attribution()
    print("Profile validation passed.")


if __name__ == "__main__":
    main()
