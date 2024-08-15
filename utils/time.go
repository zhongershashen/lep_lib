package utils

import (
	"time"
)

const DATETIME_TEMPLATE = "2006-01-02 15:04:05"
const DATE_TEMPLATE = "2006-01-02"

func GetFmtTimeStr(t time.Time) string {
	timeStr := t.Format(DATETIME_TEMPLATE)
	return timeStr
}

func GetCurDateStr() string {
	now := time.Now()
	timeStr := now.Format(DATE_TEMPLATE)
	return timeStr
}

func GetFmtDateStr(t time.Time) string {
	timeStr := t.Format(DATE_TEMPLATE)
	return timeStr
}

/*
 * 获取时间字符串
 */
func GetCurTimeStr() string {
	now := time.Now()
	timeStr := now.Format(DATETIME_TEMPLATE)
	return timeStr
}

// UTC协调世界时(Universal Time Coordinated)英文缩写，北京时间比UTC时间早8小时
func TimeStrToTimestamp(timeStr string) (t int64, e error) {
	loc, _ := time.LoadLocation("Local")
	theTime, e := time.ParseInLocation(DATETIME_TEMPLATE, timeStr, loc)
	if e == nil {
		t = theTime.Unix()
		return
	}
	return
}

func TimeStrToTime(timeStr string) (t time.Time, e error) {
	loc, _ := time.LoadLocation("Local")
	theTime, e := time.ParseInLocation(DATETIME_TEMPLATE, timeStr, loc)
	if e == nil {
		t = theTime
		return
	}
	return
}

func TimestampToTimeStr(timestamp int64) string {
	return time.Unix(int64(timestamp), 0).Format(DATETIME_TEMPLATE)
}

/**
 * 获取当前时间到t的时间间隔，单位是us
 */
func GetUsedTime(t time.Time) int64 {
	return time.Since(t).Nanoseconds() / 1000
}
