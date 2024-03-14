import crypto from "crypto"
import { NextResponse } from "next/server";

export async function GET(req) {
    var json = request.body;
    var signature = crypto
        .createHmac("sha256", privateKey)
        .update(json)
        .digest("hex");

    console.log(signature);
    console.log(json);

    return NextResponse.json(signature)
}
