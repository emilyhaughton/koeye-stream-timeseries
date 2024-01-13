###############################################################################
#qc conditional statements
###############################################################################
#Sowder, C., & Steel, E. A. (2012). A note on the collection and cleaning of water temperature data. Water, 4(3), 597-606.
#change variable names to reflect station and number of sensors at each station (i.e some statons do not have two water level sensors WtrLvl vs. WtrLvl2)

#wide to long format 
df_long<-df %>% 
  select(1:4,contains("Avg")) %>% 
  pivot_longer(WtrLvl2SNUS_Avg:TAirSSN_Avg, names_to = "Sensor", values_to = "Variable")

df_qc<-df %>% 
  mutate(temp_diff = lead(TWtr2SSNUS_Avg)-lag(TWtr2SSNUS_Avg),
         temp_diff2 = lead(TWtr2SSNUS_Avg)-lag(TWtr2SSNUS_Avg),
         qc_flag = case_when(is.na(TWtrSSNUS_Avg) ~ "MV: QC'd by EH"
                             ,TWtrSSNUS_Avg >= 25 ~ "SVC: Max temp: QC'd by EH"
                             ,TWtrSSNUS_Avg < 0 ~ "SVC: Min temp: QC'd by EH"
                             ,temp_diff > 1 ~ "SVC: Rate of change exceedance: QC'd by EH"
                             ,temp_diff2 > 1 ~ "SVC: Rate of change exceedance: QC'd by EH"
                             ,is.na(TWtr2SSNUS_Avg) ~ "MV: QC'd by EH"
                             ,TWtr2SSNUS_Avg >= 25 ~ "SVC: Max temp: QC'd by EH"
                             ,TWtr2SSNUS_Avg < 0 ~ "SVC: Min temp: QC'd by EH"
                             ,WtrLvlSSNUS_Avg < 0.03 ~  "SVC: Dewatering potential: QC'd by EH"
                             ,WtrLvl2SNUS_Avg < 0.03 ~ "SVC: Dewatering potential: QC'd by EH"
                             ,TWtrSSNUS_Avg == TAirSSN_Avg ~ "SVC: Dewatering potential: QC'd by EH"
                             ,TWtr2SSNUS_Avg == TAirSSN_Avg ~ "SVC: Dewatering potential: QC'd by EH"
                             ,TRUE ~ "AV:QC'd by EH"))
df_long_qc<-df_qc %>% 
  select(1:4,66, contains("Avg")) %>% #change based on desired column selection/number of variables being examined
  pivot_longer(TWtr2SSNUS_Avg:TAirSSN_Avg, names_to = "Sensor", values_to = "Variable") %>% 
  filter(grepl("TWtr", Sensor, ignore.case = TRUE))

#generate flag counts
data_svc<-df_long_qc %>% 
  filter(grepl("SVC", qc_flag, ignore.case=TRUE))

data_av<-df_long_qc %>% 
  filter(grepl("AV", qc_flag, ignore.case=TRUE))

data_mv<-df_long_qc %>% 
  filter(grepl("MV", qc_flag, ignore.case=TRUE))

