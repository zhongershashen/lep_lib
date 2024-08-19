package constdef

type AuditType int32

const (
	AuditType_Material AuditType = 1
	AuditType_Product  AuditType = 2
)

// 目标类型 // 1-文字，2-图片，3-视频，4-文件
type TargetType int32

const (
	TargetType_Text  TargetType = 1
	TargetType_Pic   TargetType = 2
	TargetType_Video TargetType = 3
	TargetType_File  TargetType = 4
)

// 0-待审核，1-审核通过，2-审核驳回
type AuditStatus int32

const (
	AuditStatus_Pending AuditStatus = 0
	AuditStatus_Pass    AuditStatus = 1
	AuditStatus_Fail    AuditStatus = 2
)
