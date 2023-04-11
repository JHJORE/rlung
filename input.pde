float count=0;
float collect;
float adc_volt;

float input()
{
  char p[]=new char[20];
  int x=0;
  float num=0;
  while (myPort.available() > 0)
  {
    int inByte = myPort.read();
    char ch=char(inByte);
    if (ch=='P')
    {
      x=0;
      p[x]=ch;
      x++;
    } else if (ch=='$')
    {
      x=0;
      //for(int i=0;i<6;i++)
      // {
      //   print(i+":"+p[i]+"  ");
      // }
      break;
    } else
    {
      p[x]=ch;
      x++;
    }
  }

  if (p[0]=='P')
  {
    num=(int(str(p[2]))*100)+(int(str(p[3]))*10)+(int(str(p[5])));
    if (p[1]=='-')
    {
      // print("inspiration");
      num=-1*num/10;
    } else
    {
      num=(num/10);
    }
  }
  return num;
}

//creation of array for graph plot

void arrays()
{
  // if(check_var==1)
  {
    collect=input(); 
    // check_var=0;
  }
  // else
  {
    //  delay(200);
    // check_var=1;
    count++;
  }
  if (collect<0.4 && collect>=0)


  {
    collect=0;
    enable=0;
  } else
    enable=1;
  print(collect);
  print("\t");
  array_count[timevar]=(collect/0.0122)+2048;
  print(array_count[timevar]);
  print("\t");
  adc_volt=(3.3*array_count[timevar])/4096;//pow((((array_pressure[timevar])/9.66285)+0.086722),2);
  print(adc_volt);
  print("\t");
  array_pressure[timevar]=9.66285*((sqrt(abs(adc_volt-1.65)+0.07529))-0.086722);
  if (array_pressure[timevar]<1.9 && array_pressure[timevar]>0)
  {
    array_pressure[timevar]=0;
  }
  if (adc_volt<1.65)
    array_pressure[timevar]=(-1)*array_pressure[timevar];
  print(array_pressure[timevar]);
  print("\n");
  // print(array_pressure[timevar]);
  //adc_volt=(int)pow(3.2,2.4);
  //array_volume[timevar]=(millis())*adc_volt;
  array_time[timevar]=((millis() - startingTime)/1000)*adc_volt;
  timevar++;
}
