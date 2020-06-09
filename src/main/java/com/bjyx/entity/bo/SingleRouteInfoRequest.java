package com.bjyx.entity.bo;

/*四级分拣码 通过CSB调用 SingleRouteInfoRequest 实体类*/
public class SingleRouteInfoRequest {
	public Address getSenderAddress() {
		return senderAddress;
	}
	public void setSenderAddress(Address senderAddress) {
		this.senderAddress = senderAddress;
	}
	public Address getReceiverAddress() {
		return receiverAddress;
	}
	public void setReceiverAddress(Address receiverAddress) {
		this.receiverAddress = receiverAddress;
	}
	public String getObjectId() {
		return objectId;
	}
	public void setObjectId(String objectId) {
		this.objectId = objectId;
	}
	private Address senderAddress;
	private Address receiverAddress;
	private String objectId;
}
