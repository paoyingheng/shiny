# Write function for MAP
MAP <- function(sbp, dbp) {
  return(dbp + (sbp-dbp)/3)
}

#Documentation printout
doc <- "Mean arterial pressure (MAP) is the average arterial pressure throughout one cardiac cycle, systole, 
and diastole. It is considered by many to be a better indication of perfusion than systolic blood pressure. 
True MAP can only be determined by invasive monitoring and complex calculations; 
however it can also be calculated via a formula if one has the systolic and the diastolic blood pressure readings. 
It is vital to have a MAP of at least 60 mmHg to provide enough blood to the coronary arteries, kidneys, and brain. 
The normal MAP range is between 70 and 100 mmHg. Mean arterial pressures that deviate from this range for prolonged 
periods of time can have drastic negative effects on the body."

#Reference printout
ref1 <- "1. Magder SA. The highs and lows of blood pressure: toward meaningful clinical targets in patients with shock. 
Crit Care Med. 2014;42(5):1241-1251"
ref2 <- "2. https://emtprep.com/free-training/post/map-understanding-mean-arterial-pressure"

#Instructions printout
doc2 <- "Enter the systolic blood pressure and diastolic blood pressure readings into the side bar. 
Click 'Calculate' to obtain the resulting MAP."

labelmap <- function(map) {
  ## Too low = <60
  ## Normal  = 60-100 
  ## Too high = >100 
  
  if(map < 60) {
    return("Too low! Running risk of underperfusion. Safely increase the blood pressure quickly to avoid organ damage.")
  }
  else if(map < 100) {
    return("Normal MAP. There is sufficient consistent pressure to maintain adequate tissue perfusion.")
  }
  else {
    return("Too high! There is a lot of pressure in the arteries, which may lead to blood clots or myocardial damage.")
  }
}

shinyServer(
  function(input, output) {
    output$out1 <- renderText({MAP(input$sbp, input$dbp)})
    output$out2 <- renderText({labelmap(MAP(input$sbp, input$dbp))})
    output$docu <- renderText({doc})
    output$how <- renderText({doc2})
    output$refer1 <- renderText({ref1})
    output$refer2 <- renderText({ref2})
  }
)