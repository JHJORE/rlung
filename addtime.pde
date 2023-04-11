int  startingTime=0;
int timevar=0;
int check_var=1;//count,var=0;
float array_time[ ]= new float[36000];
float array_pressure[ ]=new float[36000];
float array_volume[ ]=new float[36000];
//adc_volt, 
float array_count[ ]=new float[36000];
//collect, 
float array_check[ ]={0,0,0,0,1,2,3,5,6,7,8,9,12,9,8,7,6,5,4,3,2,1,0,0,0,0,0,0,0};

void time()
{
  int seconds = (millis() - startingTime);
  String s2 = nf(seconds, 2);
  if(timevar==0)
  {
    array_time[timevar]=int(s2);
    array_pressure[timevar]= input();
    println(timevar,int(s2),array_pressure[timevar]);
    timevar++;
  }
  else
  {
    if(int(s2)!=array_time[timevar-1])
    {
      array_time[timevar]=int(s2);
      array_pressure[timevar]=input();
      println(timevar,int(s2),array_pressure[timevar]);
      timevar++;
    }
  }
}
