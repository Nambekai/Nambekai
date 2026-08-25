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

Senior Electronics and Telecommunications Engineering student with hands-on academic experience in computer vision, deep learning, object detection, dataset curation, model evaluation, and reproducible technical documentation. Built and evaluated a YOLO11 research prototype on a 3,140-image dataset and communicated results through code, model and dataset cards, a thesis, and a defense presentation. Seeking internship opportunities in computer vision, machine learning, computer networks, or telecommunications.

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

#text(weight: "bold")[Programming and configuration:] Python, YAML, Git, GitHub, GitHub Actions \
#text(weight: "bold")[Machine learning and computer vision:] PyTorch, Ultralytics YOLO11, deep learning, object detection, model training, inference, image preprocessing, data labeling, data augmentation \
#text(weight: "bold")[Evaluation and experimentation:] train-validation-test splits, precision, recall, F1 score, IoU, mAP50, mAP50-95, confusion matrices, error analysis, experiment comparison \
#text(weight: "bold")[Data and compute:] Roboflow, Google Colab, NVIDIA Tesla T4, YOLO annotation format \
#text(weight: "bold")[Networks and telecommunications:] computer networks, data communications, telecommunications engineering fundamentals \
#text(weight: "bold")[Technical communication:] research documentation, model cards, dataset cards, reproducibility guides, responsible-use analysis

#section("Projects")

#dated-entry(
  [YOLO11 Dangerous-Person Detection in Public Areas],
  [Undergraduate Graduation Thesis | #link("https://github.com/Nambekai/dangerous-person-detection-yolo11")[GitHub repository]],
  [2026],
)
#v(0.6pt)
#text(
  size: 8.6pt,
  fill: muted,
)[Python | PyTorch | Ultralytics YOLO11 | Roboflow | Google Colab | NVIDIA Tesla T4]
- Built a two-class object-detection prototype that localizes `normal_person` and `potentially_dangerous_person` instances in public-area images for human-reviewed academic analysis.
- Curated and structured 3,140 images with 10,595 labeled person instances, including 247 self-captured public-area images and hard-negative examples; maintained an 80/10/10 train-validation-test split.
- Trained and compared five YOLO11 variants - YOLO11n, YOLO11s, a YOLO11s preprocessing variant, YOLO11m, and YOLO11l - using a consistent 832-pixel input and held-out evaluation protocol.
- Selected YOLO11s after it achieved 0.87 precision, 0.69 recall, 0.77 F1, 0.80 mAP50, and 0.64 mAP50-95 on 314 held-out test images.
- Packaged configurable training and inference scripts, YAML experiment settings, lightweight tests, checksums, versioned research artifacts, and reproducibility documentation for technical review.
- Documented limitations, potential false positives and false negatives, dataset bias, privacy considerations, and the requirement for human oversight before any operational use.

#section("Additional Information")

#text(weight: "bold")[Languages:] Vietnamese (native); English (technical reading and writing) \
#text(weight: "bold")[Availability:] Internship-level roles in computer vision, machine learning, computer networks, network communications, and telecommunications
