# styler::style_file("data-raw/data-programTable.R")

programTable <- tibble::tribble(
  ~type, ~name, ~duration, ~description,
  "Paramedical Courses", "Cytotechnologist Training Course", "1 year", "Training program for cytotechnologists.",
  "Paramedical Courses", "Cytotechnician Training Course", "6 months", "Training program for cytotechnicians.",
  "Paramedical Courses", "Quality Excellence Programme in Pathology", "1 year", "Program focusing on quality excellence in pathology.",
  "Postgraduate Programs", "Post MSc Diploma in Radiological Physics", "not specified", "Diploma program in radiological physics for post-MSc candidates.",
  "Community Oncology Programs", "Cancer Detection Clinics", "not specified", "Weekly outpatient clinics for detection of oral, breast, and uterine cervical cancers.",
  "Community Oncology Programs", "Tobacco Cessation Clinic (TCC)", "not specified", "Guidance, counseling, and NRT for tobacco users.",
  "Training Programs", "Professional Training Programs", "not specified", "For health professionals and paramedics in cancer prevention/control.",
  "Training Programs", "Trainer-Trainee Programs for Paramedicals and Health Workers", "not specified", "Training grassroots workers in cancer prevention and control.",
  "Outreach Programs", "Community Empowerment Programs", "not specified", "Community programs for cancer awareness and early detection.",
  "Outreach Programs", "Target-Oriented Programs", "not specified", "Campaigns targeting schools and vulnerable communities.",
  "Outreach Programs", "Mass Media and Exhibition Campaigns", "not specified", "Using media and exhibitions for cancer awareness.",
  "Outreach Programs", "Early Cancer Detection Programs", "not specified", "Focus on early detection of common cancers in the community."
)
