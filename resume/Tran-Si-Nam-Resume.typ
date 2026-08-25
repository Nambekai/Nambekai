// ATS-friendly resume for Tran Si Nam.
// The compact single-column structure is inspired by skyzh/chicv (CC0-1.0).

#set document(
  title: "Tran Si Nam - Resume",
  author: "Tran Si Nam",
  keywords: (
    "computer vision",
    "machine learning",
    "deep learning",
    "object detection",
    "computer networks",
    "telecommunications",
    "internship",
  ),
)

#set page(
  paper: "a4",
  margin: (x: 15mm, top: 11mm, bottom: 10mm),
  footer: context [
    #text(size: 7.5pt, fill: luma(40%))[
      Last updated: August 25, 2026
    ]
    #h(1fr)
    #text(size: 7.5pt, fill: luma(40%))[
      Page #counter(page).display("1")
    ]
  ],
)

#set text(
  font: "Arial",
  size: 9.5pt,
  lang: "en",
  region: "US",
)
#set par(
  justify: false,
  leading: 0.6em,
  spacing: 0.2em,
)
#set list(
  marker: [-],
  indent: 10pt,
  body-indent: 5pt,
  spacing: 1.5pt,
)
#show link: set text(fill: rgb("174A70"))

#let navy = rgb("17365D")
#let muted = rgb("454545")

#let section(title) = {
  v(5.5pt)
  text(size: 10.4pt, weight: "bold", fill: navy, tracking: 0.35pt)[#upper(
    title,
  )]
  v(-1.5pt)
  line(length: 100%, stroke: 0.65pt + navy)
  v(2.2pt)
}

#let dated-entry(title, organization, date, location: none) = {
  grid(
    columns: (1fr, auto),
    column-gutter: 8pt,
    [#text(weight: "bold")[#title]], [#text(weight: "bold")[#date]],
  )
  let secondary = if location == none {
    organization
  } else {
    [#organization | #location]
  }
  text(size: 9pt, fill: muted, secondary)
}

#align(center)[
  #text(size: 20pt, weight: "bold", fill: navy)[TRAN SI NAM]
  #v(1.5pt)
  #text(size: 10.2pt, weight: "bold")[
    Computer Vision | Machine Learning | Networks and Telecommunications Intern
  ]
  #v(2.8pt)
  #text(size: 8.7pt)[
    Ho Chi Minh City, Vietnam | #link("tel:+84915551529")[+84 91 555 1529] |
    #link("mailto:nambekai123@gmail.com")[nambekai123\@gmail.com] |
    #link(
      "mailto:22207062@student.hcmus.edu.vn",
    )[22207062\@student.hcmus.edu.vn]
  ]
  #v(1pt)
  #text(size: 8.7pt)[
    #link("https://www.linkedin.com/in/nambekai/")[linkedin.com/in/nambekai] |
    #link("https://github.com/Nambekai")[github.com/Nambekai]
  ]
]

#section("Professional Summary")

Senior Electronics and Telecommunications Engineering student with academic project experience in computer vision, deep learning, object detection, OCR, dataset curation, image and video preprocessing, model evaluation, LAN prototypes, and reproducible technical documentation. Contributed to a team-built Vietnamese license-plate recognition pipeline and completed a YOLO11 graduation thesis. Seeking internships in computer vision, machine learning, computer networks, or telecommunications.

#section("Education")

#dated-entry(
  [Bachelor's Program, Electronics and Telecommunications Engineering],
  [VNUHCM-University of Science | Faculty of Electronics and Telecommunications],
  [2022 to 2026],
  location: [Ho Chi Minh City, Vietnam],
)
- Undergraduate thesis defended on August 15, 2026: _Deep Learning Application for Dangerous Person Detection in Public Areas_.
- Academic focus: computer vision and machine learning, supported by computer networks, data communications, and telecommunications engineering fundamentals.

#section("Technical Skills")

#text(weight: "bold")[Programming and tools:] Python, YAML, Git, GitHub, GitHub Actions, Git LFS, Typst, Tkinter \
#text(weight: "bold")[Machine learning and computer vision:] PyTorch, Ultralytics YOLO, OpenCV, FastALPR, fast-plate-ocr, object detection, OCR, training, inference \
#text(weight: "bold")[Data and media:] data collection, bounding-box annotation, FFmpeg, image and video preprocessing, augmentation, Roboflow, Kaggle, Google Colab \
#text(weight: "bold")[Evaluation:] train-validation-test splits, precision, recall, F1 score, IoU, mAP50, mAP50-95, confusion matrices, error analysis \
#text(weight: "bold")[Networks and telecommunications:] computer networks, data communications, LAN application integration, telecommunications engineering fundamentals

#section("Projects")

#dated-entry(
  [Vietnamese Automatic License Plate Recognition with YOLO and OCR],
  [Seven-person course project | Introduction to Artificial Intelligence | #link("https://github.com/Nambekai/Nambekai/blob/main/projects/vietnamese-alpr-yolo-ocr.md")[Case study]],
  [Jan 2026 to Apr 2026],
)
#v(0.6pt)
#text(
  size: 8.6pt,
  fill: muted,
)[Python | Ultralytics YOLO | PyTorch | OpenCV | FastALPR | FFmpeg | Tkinter | Kaggle | Git LFS]
- Collaborated in a seven-person team on an end-to-end pipeline that localizes Vietnamese license plates with YOLO, applies FastALPR and fast-plate-ocr, normalizes OCR text, and produces annotated image and video output for a LAN-based whitelist demo.
- Collected and organized plate imagery, annotated license-plate bounding boxes, and used FFmpeg to extract frames and standardize media inputs for labeling, two-stage Kaggle training, and testing.
- Co-developed the Python desktop inference application and PlateGate LAN prototype with one teammate, and maintained repository and release packaging; the team reported 99.45% mAP50, 99.45% precision, and 99.37% recall on the validation set.

#dated-entry(
  [YOLO11 Dangerous-Person Detection in Public Areas],
  [Undergraduate Graduation Thesis | #link("https://github.com/Nambekai/dangerous-person-detection-yolo11")[GitHub repository]],
  [Apr 2026 to Aug 2026],
)
#v(0.6pt)
#text(
  size: 8.6pt,
  fill: muted,
)[Python | PyTorch | Ultralytics YOLO11 | Roboflow | Google Colab | NVIDIA Tesla T4]
- Built a two-class object-detection prototype and curated 3,140 images with 10,595 labeled person instances, including 247 self-captured public-area images and hard-negative examples, using an 80/10/10 train-validation-test split.
- Trained and compared five YOLO11 variants with consistent 832-pixel inputs and held-out evaluation.
- Selected YOLO11s after it achieved 0.87 precision, 0.69 recall, 0.77 F1, 0.80 mAP50, and 0.64 mAP50-95 on 314 held-out test images.
- Packaged training and inference scripts, YAML experiment settings, tests, checksums, versioned artifacts, model and dataset cards, and reproducibility guidance; documented limitations and the requirement for human oversight.

#section("Additional Information")

#text(weight: "bold")[Languages:] Vietnamese (native); English (technical reading and writing) \
#text(weight: "bold")[Availability:] Internship-level roles in computer vision, machine learning, computer networks, network communications, and telecommunications
