//float ex1[] = new float[250];

//float[] ex= { 0.0,0.01,0.03,0.04 ,0.06 ,0.07,0.09,0.1,0.12,0.13,0.14,0.16,0.17 ,0.19 ,0.2 ,0.22,0.23 ,0.25,0.26,0.27 ,0.29 ,0.3,0.32 ,0.33 ,0.35,0.36,0.38,0.39 ,0.4,0.42,0.43 ,0.45,0.46 ,0.48 ,0.49 ,0.51,0.52 ,0.53 ,0.55,0.56 ,0.58,0.59 ,0.61 ,0.62 ,0.64,0.65 ,0.66 ,0.68 ,0.69,0.71,0.72 ,0.74 ,0.75 ,0.77 ,0.78 ,0.79,0.81,0.82 ,0.84 ,0.85,0.87 ,0.88,0.9,0.91 ,0.92 ,0.94,0.95 ,0.97 ,0.98,1.0 ,1.01 ,1.03 ,1.04 ,1.05 ,1.07 ,1.08 ,1.1 ,1.11,1.13,1.14 ,1.16,1.17,1.18 ,1.2 ,1.21 ,1.23,1.24 ,1.26,1.27,1.29,1.3 ,1.31 ,1.33 ,1.34 ,1.36 ,1.37 ,1.39,1.4 ,1.42,1.43 ,1.44 ,1.46,1.47,1.49 ,1.5,1.52,1.53,1.55,1.56,1.57,1.59,1.6,1.62,1.63,1.65,1.66,1.68,1.69,1.7,1.72,1.73,1.75,1.76,1.78,1.79,1.81,1.82,1.83,1.85,1.86,1.88,1.89,1.91,1.92,1.94,1.95,1.96,1.98,1.99,2.01,2.02,2.04,2.05,2.07,2.08,2.09,2.11,2.12,2.14,2.15};

void drawgraph()
{ 
  int nPoints = timevar;
  GPointsArray points = new GPointsArray(nPoints); 
  for (int i = 0; i < nPoints-1; i++) 
  {
    points.add(array_time[i],array_pressure[i]);
  } 
  plot1 = new GPlot(this);
  plot1.setPos(225,85);
  plot1.setMar(60, 70, 40, 70);
  plot1.setBoxBgColor(color(18,58,109));
  plot1.setDim(365, 250);
  plot1.setPoints(points);
  plot1.setBoxLineColor(color(255,255,255));
      //plot1.setExpandLimFactor(0.1);
      //print(ceil(Array_Voc[0])+ceil(Array_Voc[0])%10+"\n");
      //int xlim=ceil(Array_Voc[0])+ceil(Array_Voc[0])%10;
     // plot1.setXLim(0,xlim);
      //plot1.setXLim(0,700);
     // int ylim= ceil(Array_Isc[Array_Isc.length-2]);
      //print(Array_Isc[0]);
     // plot1.setYLim(0,ylim);
  plot1.setAllFontProperties("Arial Bold",color(255,255,0),14);
  plot1.getYAxis().setAxisLabelText("Flowrate(L/Sec)");
  plot1.getXAxis().setAxisLabelText("Volume(L)");
  plot1.setLineColor(color(255,255,0));
  plot1.setLineWidth(3);
  plot1.setPointColor(color(255,0,0));
  plot1.setPointSize(2); 
  
 // noLoop();
  delay(150);
}
