tripay_api_key := DEV-lXKEtYrVowOCy9uQOK8R2xGiZMX3O3fkVpPM7jTj

payment_instruction:
	curl -X GET -H "Authorization: Bearer $(tripay_api_key)" -H "Content-Type: application/json" -d '{"code":"BRIVA"}' https://tripay.co.id/api-sandbox/payment/instruction | jq

payment_channel:
	curl -X GET -H "Authorization: Bearer $(tripay_api_key)"  https://tripay.co.id/api-sandbox/merchant/payment-channel | jq

fee_calc:
	curl -X GET -H "Authorization: Bearer $(tripay_api_key)" -H "Content-Type: application/json" \
		-d '{"amount": "10000000", "code":"BRIVA"}' \
		https://tripay.co.id/api-sandbox/merchant/fee-calculator | jq

list_trans:
	curl -X GET -H "Authorization: Bearer $(tripay_api_key)" https://tripay.co.id/api-sandbox/merchant/transactions | jq

create_signature:
	node signature.js

privateKey:="Id1Ie-ABSHr-f7V23-ElINN-gsYwH"
merchant_code:="T30157"
merchant_ref:=
amount:=150000

request_transaksi:
	curl -X POST -H "Authorization: Bearer $(tripay_api_key)" -H "Content-Type: application/json" \
		-d @tes.json  \
		https://tripay.co.id/api-sandbox/transaction/create | jq

detail_transaksi:
	curl -X GET -H "Authorization: Bearer $(tripay_api_key)" -H "Content-Type: application/json" -d '{"reference":"DEV-T301571474398YGKV"}' https://tripay.co.id/api-sandbox/transaction/detail | jq

biteship_api_key := biteship_test.eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoidGVzdGluZyIsInVzZXJJZCI6IjY1ZjA3YWJmM2Q2N2JmMDAxMjQ3ODQxNSIsImlhdCI6MTcxMDM2NDg2Nn0.tdSrCCxNpUorJ9Zjr3G0uEplEkmE4nMgrw4l2Dn3z3I

get_areas:
	curl -X GET -H "Authorization: Bearer $(biteship_api_key)"  "https://api.biteship.com/v1/maps/areas?countries=ID&input=Jakarta+Selatan" | jq

get_areasdob:
	curl -X GET -H "Authorization: Bearer $(biteship_api_key)"  "https://api.biteship.com/v1/maps/areas/IDNP6IDNC148IDND843IDZ12320" | jq 
