package tools

import (
	"fmt"
	"math/rand"
	"reflect"
	"regexp"
	"strings"
	"time"

	"github.com/bytedance/sonic"
)

var (
	SimpleIpPattern  = regexp.MustCompile(`[0-9]{1,}\.[0-9]{1,}\.[0-9]{1,}\.[0-9]{1,}$`)
	PrivateIpPattern = regexp.MustCompile(`^192\.168\.|^10\.|^172\.(1[6-9]|2[0-9]|3[01])\.`)
)

func TrimWithSpace(s string) string {
	return strings.Trim(s, "\t ")
}

func init() {
	rand.Seed(time.Now().Unix())
}

// 格式化对象输出（json序列化）
func GetLogStr(obj interface{}) string {
	if obj == nil {
		return ""
	}
	bs, err := sonic.MarshalString(obj)
	if err != nil {
		return fmt.Sprintf("Marshal Error. obj=%v err=%v", obj, err)
	}
	return bs
}

func IsNil(i interface{}) bool {
	if i == nil {
		return true
	}
	vi := reflect.ValueOf(i)
	if vi.Kind() == reflect.Ptr {
		return vi.IsNil()
	}
	return false
}
