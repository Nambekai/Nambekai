# Vietnamese Automatic License Plate Recognition with YOLO and OCR

## Project Summary

| Field | Details |
| --- | --- |
| Period | January 2026 to April 2026 |
| Context | Introduction to Artificial Intelligence course project |
| Institution | VNUHCM-University of Science, Faculty of Electronics and Telecommunications |
| Team | Seven students |
| Task | Vietnamese automatic license plate recognition |
| Scope | Academic dataset and LAN-based prototype |
| Team repository | [lhlizdabezt/NhapMonAI](https://github.com/lhlizdabezt/NhapMonAI) |
| Repository status | The original URL was unavailable during the August 25, 2026 review; this case study preserves a working evidence summary until access returns. |

The project implemented an end-to-end automatic license plate recognition pipeline. YOLO localized a license plate, FastALPR and fast-plate-ocr decoded the cropped plate region, and a normalization stage converted OCR output into a consistent plate string. The application produced annotated image and video output and supported a PlateGate LAN whitelist demonstration.

## Processing Pipeline

```text
Image or video input
        |
        v
FFmpeg frame extraction and media normalization
        |
        v
YOLO license-plate localization
        |
        v
Plate crop and OpenCV preparation
        |
        v
FastALPR and fast-plate-ocr recognition
        |
        v
Plate-string normalization
        |
        +--> Annotated image or video output
        |
        `--> PlateGate LAN whitelist demonstration
```

## Confirmed Contributions by Tran Si Nam

- Coordinated reviews of the train, validation, and test dataset structure and checked image or label anomalies with the team.
- Cross-checked YOLO five-column label formatting, bounding-box records, dataset paths, and the `data.yaml` configuration used by the Ultralytics workflow.
- Tested the video pipeline across multiple media formats, including FFmpeg codec, container, playback, and annotated-output checks.
- Verified demonstration failure cases covering missing model paths or dependencies, low-light imagery, small or tilted plates, and common OCR character confusions.

These responsibilities follow the Group 05 work-allocation report dated May 7, 2026. They do not attribute primary model training, OCR integration, desktop application development, PlateGate development, or repository release maintenance to Tran Si Nam. Team-wide results are not presented as individual achievements.

## Team-Reported Validation Results

The YOLO detector was trained on Kaggle in two stages. The team reported the following validation-set results:

| Metric | Result |
| --- | ---: |
| mAP at 0.5 IoU | 99.45% |
| Precision | 99.45% |
| Recall | 99.37% |
| mAP at 0.5 to 0.95 IoU | 77.01% |

The downloaded report sources record exact values of 0.99450 mAP50, 0.99448 precision, 0.99373 recall, and 0.77006 mAP50-95 for the continuation-training checkpoint. These measures describe the team's validation set. They do not establish performance on independent traffic-camera data or production deployments.

## Technology Stack

- Python, PyTorch, Ultralytics YOLO, and OpenCV
- FastALPR and fast-plate-ocr
- FFmpeg for frame extraction and media preparation
- Tkinter for the desktop interface
- Kaggle for two-stage detector training
- Git, GitHub, Git LFS, and release packaging
- Typst for technical documentation

The stack describes the team project. It is not a claim that every member implemented every component.

## Evidence Reviewed

- Group 05 work-allocation report, five pages, dated May 7, 2026
- Group 05 seminar report, 44 pages, prepared for the May 8, 2026 presentation
- Typst report sources and validation tables for the two-stage detector training
- Python desktop application, PlateGate PC source, notebooks, screenshots, and release notes from the downloaded archive

The original repository link is retained above as requested. See the [repository recovery guide](../docs/ALPR-REPOSITORY-RECOVERY.md) for the publication and privacy checks to complete when the team repository becomes available again.

## Limitations and Responsible Use

- The project was limited to an academic dataset and a LAN-based prototype.
- Reported metrics were matched against the downloaded report sources but were not independently reproduced by rerunning training.
- The system was not validated for production traffic enforcement, legal identification, billing, or unattended physical-access decisions.
- Performance may change with camera angle, plate layout, motion blur, low light, occlusion, compression, weather, and unseen plate formats.
- Any operational deployment would require independent evaluation, privacy review, access controls, error handling, audit logs, and human oversight.
