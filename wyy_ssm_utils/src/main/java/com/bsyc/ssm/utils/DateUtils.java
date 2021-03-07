package com.bsyc.ssm.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @program: wyy_ssm
 * @description:
 * @author: wyy
 * @create: 2021-03-05 20:35
 **/
public class DateUtils {

    //日期转换成字符串
    public static String date2String(Date date, String patt){
        SimpleDateFormat sdf = new SimpleDateFormat(patt);
        String strDate = sdf.format(date);
        return strDate;
    }

    //字符串转换成日期
    public static Date string2Date(String strDate, String patt) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat(patt);
        Date parseDate = sdf.parse(strDate);
        return parseDate;
    }
}
