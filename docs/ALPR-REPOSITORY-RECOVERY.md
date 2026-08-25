# ALPR Repository Recovery and Publication Guide

This guide applies to the seven-person Vietnamese automatic license plate recognition course project at [lhlizdabezt/NhapMonAI](https://github.com/lhlizdabezt/NhapMonAI). The original repository returned HTTP 404 during the August 25, 2026 review. The downloaded archive had no `.git` directory, so it cannot preserve or safely replace the missing repository history.

## Audit Summary

| Finding | Review Result |
| --- | --- |
| Downloaded package | 190 files, approximately 410.5 MB |
| Git history | Not present in the downloaded root or extracted repository folder |
| High-confidence credentials | No GitHub token, AWS key, private-key header, bearer token, or generic API-key assignment detected |
| Network data | Private LAN addresses occur in both training notebooks and should be cleared or generalized before publication |
| Personal or vehicle data | Sample images, crops, annotated outputs, and allow-list data require privacy review |
| Duplicate or bundled content | FFmpeg executables, model checkpoints, archives, extracted copies, report images, and notebooks include substantial duplication |
| Third-party material | Saved web pages, upstream source archives, fonts, guides, and dataset material require license review before redistribution |

## Recommended Public Scope

Publish only files that the team is authorized to redistribute and that help a reviewer understand or reproduce the project:

- concise US English `README.md`, release notes, and run instructions;
- the maintained Python desktop application and PlateGate source files with professional filenames;
- a version-pinned `requirements.txt` or environment specification;
- notebooks after clearing private paths, LAN addresses, credentials, oversized outputs, and unrelated runtime logs;
- Typst report sources and selected academic deliverables approved by all team members and the course;
- selected de-identified screenshots that demonstrate the pipeline without exposing unnecessary plate or personal data;
- one documented model checkpoint through Git LFS or a release asset, only if dataset and model licensing permit redistribution.

## Exclude or Review Before Publishing

- Do not upload lecture files, examination files, thesis-writing guides, Typst guides, saved third-party web pages, or upstream project archives merely because they were present in the downloaded folder.
- Do not commit bundled FFmpeg executables. Link to the official FFmpeg distribution and document installation instead.
- Do not publish duplicate `.zip` and `.7z` archives alongside their extracted contents.
- Do not publish real vehicle plate crops or allow-list entries without a documented privacy and consent basis.
- Do not add an open-source license unless every rights holder agrees and the team has the right to license the included code, media, model, and data.
- Do not force-push the downloaded snapshot over restored history.

## Recovery Procedure

1. Confirm that the original owner has restored the repository and that collaborators have write or pull-request access.
2. Clone the restored repository into a new directory with Git LFS enabled; do not initialize Git inside the downloaded archive.
3. Create a branch such as `docs/recovery-review` from the restored default branch.
4. Compare the restored tree with the downloaded archive by relative path, file size, and SHA-256 hash.
5. Apply only reviewed source, documentation, and de-identified visual changes. Keep the original authorship and team roles intact.
6. Clear notebook outputs and private paths, replace placeholder allow-list values, and run a credential scan.
7. Test Python syntax, dependency installation, image inference, video inference, FFmpeg behavior, PlateGate health and scan endpoints, and Typst compilation.
8. Review the complete Git diff with the team, then open a pull request instead of pushing directly to the default branch.
9. After approval, merge the pull request, add repository description and topics, and create a signed or annotated release tag with a concise asset list.
10. Recheck the public repository, release downloads, image captions, external links, and privacy-sensitive files from a signed-out browser session.

## Verified Contributor Attribution

The Group 05 work-allocation report attributes the following responsibilities to Tran Si Nam:

- coordinated dataset review and checks for anomalous images or YOLO labels;
- cross-checked dataset paths and configuration with the team;
- tested multiple video formats, FFmpeg behavior, and annotated outputs;
- participated in system tests covering missing files or dependencies, codec problems, difficult imagery, and OCR errors.

The same report attributes primary model training, OCR integration, desktop application development, PlateGate development, and final repository or submission packaging to other team members. Public profiles should preserve that distinction.

## Release Checklist

- [ ] Repository ownership and collaborator access confirmed
- [ ] Git history preserved
- [ ] Team approval recorded for public academic deliverables
- [ ] Dataset, model, code, font, and image licensing reviewed
- [ ] Real plate data removed, de-identified, or explicitly approved
- [ ] Credentials, private paths, LAN addresses, and notebook outputs cleared
- [ ] Duplicate archives and bundled executables excluded
- [ ] README commands tested in a clean environment
- [ ] Metrics attributed to the team and validation set
- [ ] Academic prototype and non-production limitations stated
- [ ] Pull request reviewed before merge
- [ ] Release assets, tags, topics, and links checked after publication

## Frequently Asked Questions

### Can the downloaded folder be uploaded now as a replacement repository?

It should not be uploaded wholesale. It lacks Git history and contains duplicated binaries, archives, third-party material, notebooks with private network data, and vehicle imagery requiring review.

### Why keep the unavailable GitHub URL in the resume and profile?

It is the original team-project location supplied by the contributor. The working case study provides a stable evidence path while the original owner restores access.

### Can Git LFS solve every large-file problem?

No. Git LFS can store large authorized assets, but it does not resolve privacy, copyright, dataset licensing, duplication, or repository-history concerns.

### Should every course document be public?

No. Publish only deliverables the team and course permit sharing. Lecture, examination, guide, and third-party files should remain outside the public repository unless explicit redistribution rights are documented.
