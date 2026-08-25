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

- Collected and organized Vietnamese license-plate imagery for dataset preparation.
- Annotated license-plate bounding boxes used for detector training and validation.
- Used FFmpeg to extract video frames and standardize image and video inputs for labeling, training, and testing.
- Co-developed the Python desktop inference application and the PlateGate PC LAN demonstration with one teammate.
- Maintained repository structure, Git LFS assets, and release packaging.

These responsibilities are intentionally limited to contributions confirmed by the project author. Team-wide results are not presented as individual achievements.

## Team-Reported Validation Results

The YOLO detector was trained on Kaggle in two stages. The team reported the following validation-set results:

| Metric | Result |
| --- | ---: |
| mAP at 0.5 IoU | 99.45% |
| Precision | 99.45% |
| Recall | 99.37% |

These measures describe the team's validation set. They do not establish performance on independent traffic-camera data or production deployments.

## Technology Stack

- Python, PyTorch, Ultralytics YOLO, and OpenCV
- FastALPR and fast-plate-ocr
- FFmpeg for frame extraction and media preparation
- Tkinter for the desktop interface
- Kaggle for two-stage detector training
- Git, GitHub, Git LFS, and release packaging
- Typst for technical documentation

## Limitations and Responsible Use

- The project was limited to an academic dataset and a LAN-based prototype.
- Results were not independently reproduced during this profile update.
- The system was not validated for production traffic enforcement, legal identification, billing, or unattended physical-access decisions.
- Performance may change with camera angle, plate layout, motion blur, low light, occlusion, compression, weather, and unseen plate formats.
- Any operational deployment would require independent evaluation, privacy review, access controls, error handling, audit logs, and human oversight.
