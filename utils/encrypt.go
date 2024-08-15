package utils

import (
	"github.com/deatil/go-cryptobin/cryptobin/crypto"
	"github.com/deatil/go-cryptobin/cryptobin/crypto/encrypt/threeway"
)

const (
	Key = "dfertf12dfyy"
	Iv  = "dfertf12dfer"
)

func Encrypt(origin string) string {
	crypt := crypto.FromString(origin).
		SetKey(Key).
		SetIv(Iv).
		MultipleBy(threeway.Threeway).
		CFB().
		PKCS7Padding().
		Encrypt().
		ToBase64String()
	return crypt
}
func Decrypt(origin string) string {
	toString := crypto.FromBase64String(origin).
		SetKey(Key).
		SetIv(Iv).
		MultipleBy(threeway.Threeway).
		CFB().
		PKCS7Padding().
		Decrypt().
		ToString()
	return toString
}
