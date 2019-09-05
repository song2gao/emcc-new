<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.cic.domain.PomsConsumptionLoadConfig"%>
<%@page import="com.cic.domain.PomsCalculateTerminalDevice"%>

<%@page import="java.util.List"%>
<%@page import="org.apache.taglibs.standard.tag.common.core.ForEachSupport"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 	
<title>无标题文档</title> 

<style type="text/css"> 
.zz { 
height: 1200px; 
width: 958px auto; 
border: 1px solid #CCCCCC; 
margin-top: 5px; 
margin-bottom: 5px; 
margin-left:auto; 
margin-right:auto; 
} 
a {font-family: "宋体"; 
font-size: 12pt; 
color: #666666; 
text-decoration: none;} 
</style> 


<script language="javascript"> 
function $(id){return document.getElementById(id)} 
function offset(node){ 
	var x = node.offsetLeft; 
	var y = node.offsetTop; 
	var w = node.offsetWidth; 
	var h = node.offsetHeight; 
	var parent = node.offsetParent; 
	while (parent != null){ 
		x += parent.offsetLeft; 
		y += parent.offsetTop; 
		parent = parent.offsetParent; 
	} 
	if(w==0){ 
		w+=parseInt(node.currentStyle.width); 
		w+=parseInt(node.currentStyle.paddingRight); 
		w+=parseInt(node.currentStyle.paddingLeft); 
		w+=parseInt(node.currentStyle.borderWidth) * 2; 
	} 
	if(h==0){ 
		h+=parseInt(node.currentStyle.height); 
		h+=parseInt(node.currentStyle.paddingTop); 
		h+=parseInt(node.currentStyle.paddingBottom); 
		h+=parseInt(node.currentStyle.borderWidth) * 2; 
	} 
	return {x: x, y: y, w: w, h: h}; 
} 

function OrgNode(){ 
this.Text=null; 
this.Link=null; 
this.Description="点击查看相关人员"; 
this.BoxWidth=null; 
this.BoxHeight=null; 
this.parentNode=null; 
this.NodeGroupId=null; //同一层的级别序号,从零开始 
this.NodeOrderId=null; //同一级中的序号,从零开始 
this.TopLine=null; 
this.BottomLine=null; 
this.Depth=null; 
this.Top=null; 
this.Left=null; 
this.Type=null; 
this.Nodes=[]; 
this.customParam=[]; //节点自定义参数 
var This=this; 
this.Nodes.Add=function(OrgNode_){ 
	OrgNode_.parentNode=This; 
	This.Nodes[This.Nodes.length]=OrgNode_; 
} 
this.Box=null; 
this.Templet=null; 
this.Id="OrgNode_"+ GetRandomId(20); 

this.inIt= function(){ 
	if(this.inIted==true)return; 
	var tempDiv=document.createElement("DIV"); 
	document.body.appendChild(tempDiv); 
	var tempHTML=this.Templet; 
	tempHTML=tempHTML.replace("{Id}", this.Id); 
	tempHTML=tempHTML.replace("{Text}", this.Text); 
	tempHTML=(this.Link==null)?tempHTML.replace("{Link}", "JavaScript:void(0)"):tempHTML.replace("{Link}", this.Link); 
	tempHTML=tempHTML.replace("{Description}", this.Description); 
	for(var Param_ in  this.customParam){ 
	tempHTML=tempHTML.replace("{"+ Param_ +"}", this.customParam[Param_]); 
	} 
	tempDiv.innerHTML=tempHTML; 
	this.Box=$(this.Id); 
	
	if(this.BoxWidth!=null){ 
	if(offset(this.Box).w < this.BoxWidth){ 
	this.Box.style.width=this.BoxWidth +"px"; 
	if(offset(this.Box).w > this.BoxWidth){ 
	this.Box.style.width=(this.BoxWidth - (offset(this.Box).w - this.BoxWidth)) +"px"; 
	} 
	} 
	} 
	
	if(this.BoxHeight!=null){ 
	if(offset(this.Box).h < this.BoxHeight){ 
	this.Box.style.height=this.BoxHeight +"px"; 
	if(offset(this.Box).h > this.BoxHeight){ 
	this.Box.style.height=(this.BoxHeight - (offset(this.Box).h - this.BoxHeight)) +"px"; 
	} 
	} 
	} 
	
	this.Width=offset(this.Box).w; 
	this.Height=offset(this.Box).h; 
	this.inIted=true; 
} 

function GetRandomId(n_){ 
	var litter="abcdefghijklmnopqrstuvwxyz" 
	litter+=litter.toUpperCase() 
	litter+="1234567890"; 
	var idRnd=""; 
	for(var i=1; i<=n_; i++){ 
		idRnd+=litter.substr((0 + Math.round(Math.random() * (litter.length - 0))), 1) 
	} 
      return idRnd; 
} 
} 


function OrgShow(OrgNode_){ 
this.LineSize=2; 
this.LineColor="#000000"; 

this.IntervalWidth=100; 
this.IntervalHeight=50; 
this.Top=0; 
this.Left=0; 
this.Depth=0; 
this.Nodes=[]; 
this.DepthGroup=[]; //this.DepthGroup[n].Nodes 层深节点集合 
//this.DepthGroup[n].NodeGroups[m]  层深节点按上层分类集合 this.DepthGroup[n].NodeGroups[m][k]层深节点 
var This=this; 
this.BoxWidth=null; 
this.BoxHeight=null; 
this.BoxTemplet=null; 
this.ShowType=null; 

this.Run=function(){ 
BoxInit(OrgNode_); 
GetDepth(OrgNode_); 
SetDepthsHeight()//设置层深高度 

//*************************** 
for(var n=1; n<=this.Depth; n++){//设置顶距离 
var tempTop=this.Top + GetDepthHeightToRoot(n); 
var tempNodes=this.DepthGroup[n].Nodes; 
for(var m=0; m<tempNodes.length; m++){ 
tempNodes[m].Top=tempTop; 
} 
} 

//*************************** 
for(var n=this.Depth; n>=1; n--){//设置左距离 
var DepthNodes=this.DepthGroup[n].Nodes; 
if(n==this.Depth){ 
for(var m=0; m<DepthNodes.length; m++){ 
if(m==0){ 
DepthNodes[m].Left=0; 
}else{ 
DepthNodes[m].Left=DepthNodes[m-1].Left + DepthNodes[m-1].Width + this.IntervalWidth; 
} 
} 
}else{ 
for(var m=0; m<DepthNodes.length; m++){//根据下级节点位置，确定节点位置 
if(DepthNodes[m].Nodes.length!=0){ 
var tempNodeLeft_=DepthNodes[m].Nodes[0].Left + (GetGroupWidthByNode(DepthNodes[m].Nodes[0]) / 2); 
tempNodeLeft_-=(DepthNodes[m].Width / 2); 
DepthNodes[m].Left = tempNodeLeft_; 
} 
} 
for(var m=0; m<DepthNodes.length; m++){ 
if(DepthNodes[m].Left==null){//没有下级节点的， 
SetLeftByDepthNode(DepthNodes, m, "LTR"); 
} 
} 

for(var m=1; m<DepthNodes.length; m++){//修正错误位置 
var ErrDistance=this.IntervalWidth - (DepthNodes[m].Left - DepthNodes[m-1].Left - DepthNodes[m-1].Width); 
if(ErrDistance>0){ 
for(var u_=m; u_<DepthNodes.length; u_++){ 
AmendNodeLeft(DepthNodes[u_], ErrDistance); 
} 
} 
} 
} 
} 
SetDepthGroupWidth();//设置群组宽度 

var MaxLeftValue=this.Nodes[0].Left; 
for(var n=1; n<this.Nodes.length; n++){//取得最小左距离 
if(MaxLeftValue>this.Nodes[n].Left){ 
MaxLeftValue=this.Nodes[n].Left; 
} 
} 
MaxLeftValue=(-MaxLeftValue) + this.Left; 
for(var n=0; n<this.Nodes.length; n++){//重新设置距离 
this.Nodes[n].Left+=MaxLeftValue; 
this.Nodes[n].Box.style.left=this.Nodes[n].Left + "px" 
this.Nodes[n].Box.style.top=this.Nodes[n].Top + "px" 
} 


//*************************** 
for(var n=1; n<=this.Depth; n++){//设置竖线条 
	var tempNodes=this.DepthGroup[n].Nodes; 
	for(var m=0; m<tempNodes.length; m++){ 
	if(n!=this.Depth){//设置底线条 
	if(tempNodes[m].Nodes.length!=0){ 
	var tempLineLeft=tempNodes[m].Left + (tempNodes[m].Width / 2); 
	var tempLineHeight=((this.IntervalHeight - this.LineSize) / 2); 
	tempLineHeight+=(this.DepthGroup[n].Height - tempNodes[m].Height); 
	var tempLineTop=tempNodes[m].Top + tempNodes[m].Height; 
	var tempBottomLine=new CreateLine(2, tempLineTop, tempLineLeft, tempLineHeight, this.LineSize, this.LineColor, "LineBottom_"+ tempNodes[m].Id); 
	tempNodes[m].BottomLine=tempBottomLine.Line; 
	} 
	} 
	if(n!=1){//设置顶线条 
	var tempLineLeft=tempNodes[m].Left + (tempNodes[m].Width / 2); 
	var tempLineHeight=((this.IntervalHeight - this.LineSize) / 2); 
	var tempLineTop=tempNodes[m].Top - tempLineHeight; 
	if(this.DepthGroup[tempNodes[m].Depth].NodeGroups[tempNodes[m].NodeGroupId].length==1){//如果只有一个节点 
	var tempBottomLineHeight=parseFloat(tempNodes[m].parentNode.BottomLine.style.height) + this.LineSize; 
	tempNodes[m].parentNode.BottomLine.style.height=(tempLineHeight + tempBottomLineHeight)+"px"; 
	}else{ 
	var temptopLine=new CreateLine(2, tempLineTop, tempLineLeft, tempLineHeight, this.LineSize, this.LineColor, "LineTop_"+ tempNodes[m].Id); 
	tempNodes[m].TopLine=temptopLine.Line; 
	} 
	} 
	} 
} 

for(var n=2; n<=this.Depth; n++){//设置横线条 
	var tempNodeGroups_=this.DepthGroup[n].NodeGroups; 
	for(var m=0; m<tempNodeGroups_.length; m++){ 
		if(tempNodeGroups_[m].length!=1){ 
		var tempLineWidth=tempNodeGroups_[m].Width - (tempNodeGroups_[m][0].Width / 2) + this.LineSize; 
		tempLineWidth-=(tempNodeGroups_[m][tempNodeGroups_[m].length-1].Width / 2); 
		var tempLineTop=tempNodeGroups_[m][0].Top - ((this.IntervalHeight - this.LineSize) / 2) - this.LineSize; 
		var tempLineLeft=tempNodeGroups_[m][0].Left + (tempNodeGroups_[m][0].Width / 2); 
		var tempGroupLine=new CreateLine(1, tempLineTop, tempLineLeft, tempLineWidth, this.LineSize, this.LineColor, "LineGroup_"+ tempNodeGroups_[m][0].Id); 
		} 
	} 
} 

//************************************************************************************************* 

function AmendNodeLeft(Node_, ErrDistance_){//修正错误位置 
Node_.Left=Node_.Left + ErrDistance_; 
if(Node_.Nodes.length!=0){ 
for(var n=0; n<Node_.Nodes.length; n++){ 
AmendNodeLeft(Node_.Nodes[n], ErrDistance_); 
} 
} 
} 


} 
function GetGroupWidthByNode(Node_){//根据群组中任一节点，取得群组宽度 
	var tempNodesGroup_=This.DepthGroup[Node_.Depth].NodeGroups[Node_.NodeGroupId]; 
	var tempGroupWidth_=tempNodesGroup_[tempNodesGroup_.length-1].Left - tempNodesGroup_[0].Left; 
	tempGroupWidth_+=tempNodesGroup_[tempNodesGroup_.length-1].Width 
	return tempGroupWidth_; 
} 


function SetLeftByDepthNode(DepthNodes_, NodeId, Type){ 
	if(Type=="LTR"&&NodeId==DepthNodes_.length-1){ 
		SetLeftByDepthNode(DepthNodes_, NodeId, "RTL"); 
		return; 
	} 
	if(Type=="RTL"&&NodeId==0){ 
		SetLeftByDepthNode(DepthNodes_, NodeId, "LTR"); 
		return; 
	} 
	var FindIndex=null; 
	if(Type=="LTR"){ 
		for(var r_=NodeId+1; r_<DepthNodes_.length; r_++){ 
			if(DepthNodes_[r_].Left!=null){ 
			FindIndex=r_; 
			break; 
			} 
		} 
		if(FindIndex==null){ 
			SetLeftByDepthNode(DepthNodes_, NodeId, "RTL"); 
			return; 
			}else{ 
			for(var r_=FindIndex-1; r_>=NodeId; r_--){ 
				DepthNodes_[r_].Left=DepthNodes_[r_+1].Left - This.IntervalWidth - DepthNodes_[r_].Width; 
			} 
		} 
	} 
	if(Type=="RTL"){ 
	for(var r_=NodeId-1; r_>=0; r_--){ 
	if(DepthNodes_[r_].Left!=null){ 
	FindIndex=r_; 
	break; 
	} 
	} 
	if(FindIndex==null){ 
	SetLeftByDepthNode(DepthNodes_, NodeId, "LTR"); 
	return; 
	}else{ 
	for(var r_=FindIndex+1; r_<=NodeId; r_++){ 
	DepthNodes_[r_].Left=DepthNodes_[r_-1].Left + This.IntervalWidth + DepthNodes_[r_-1].Width; 
	} 
	} 
	} 
} 







function GetDepthHeightToRoot(DepthId){//取得距离顶层的高度 
var tempHeight_=0; 
for(var x_=DepthId; x_>=1; x_--){ 
tempHeight_+=This.DepthGroup[x_].Height; 
} 
tempHeight_+=This.IntervalHeight * (DepthId - 1); 
tempHeight_-=This.DepthGroup[DepthId].Height; 
return tempHeight_; 
} 


function SetLeftPosByChildNode(Node_, ChildNode_){//根据下级节点位置设置节点位置 
var tempNodeGroups=This.DepthGroup[ChildNode_.Depth].NodeGroups[ChildNode_.NodeGroupId]; 
var tempNodeLeft; 
if(tempNodeGroups.length==1){ 
tempNodeLeft=((ChildNode_.Width / 2) + ChildNode_.Left) - (Node_.Width / 2); 
}else{ 
tempNodeLeft=GetFirstLeftPos(ChildNode_) + (tempNodeGroups.Width / 2) - (Node_.Width / 2); 
} 
Node_.Left=tempNodeLeft; 
} 

function GetFirstLeftPos(Node_){//根据节点位置取得同一级中首个节点位置 
if(Node_.NodeOrderId==0){//Node_为首节点 
return Node_.Left; 
} 
var tempWidth=0; 
for(var k_=0; k_<=Node_.NodeOrderId; k_++){ 
var tempGroupsNode=This.DepthGroup[Node_.Depth].NodeGroups[Node_.NodeGroupId][k_]; 
tempWidth+=tempGroupsNode.Width; 
} 
tempWidth+=(Node_.NodeOrderId * This.IntervalWidth); 
return ((Node_.Left - tempWidth) + (Node_.Width / 2)); 
} 


function ChildNodesWidth(OrgObj){//取得层宽 
var ReWidth=0; 
for(var s_=0; s_<OrgObj.Nodes.length; s_++){ 
ReWidth+=OrgObj.Nodes[s_].Width; 
} 
ReWidth+=(OrgObj.Nodes.length-1) * This.IntervalWidth; 
return ReWidth; 
} 

function SetDepthGroupWidth(){//设置层深宽度 
for(var n_=1; n_<=This.Depth; n_++){ 
var tempNodeGroups=This.DepthGroup[n_].NodeGroups; 
for(var m_=0; m_<tempNodeGroups.length; m_++){ 
tempNodeGroups[m_].Width=GetGroupWidthByNode(tempNodeGroups[m_][0]); 
} 
} 
} 


function SetDepthsHeight(){//设置层深高度 
for(var n_=1; n_<=This.Depth; n_++){ 
var tempNodes_=This.DepthGroup[n_].Nodes; 
var MaxHeight=0; 
for(var m_=0; m_<tempNodes_.length; m_++){ 
if(tempNodes_[m_].Height>MaxHeight){ 
MaxHeight=tempNodes_[m_].Height; 
} 
} 
This.DepthGroup[n_].Height=MaxHeight; 
} 
} 

function GetDepth(OrgObj){//取得层深,层群集 
This.Nodes[This.Nodes.length]=OrgObj; 
OrgObj.Depth=(This.Depth==0)?This.Depth+1:OrgObj.parentNode.Depth+1; 
This.Depth=(OrgObj.Depth>This.Depth)?OrgObj.Depth:This.Depth; 
if(typeof(This.DepthGroup[OrgObj.Depth])!="object"){ 
This.DepthGroup[OrgObj.Depth]=[]; 
This.DepthGroup[OrgObj.Depth].Nodes=[]; 
This.DepthGroup[OrgObj.Depth].NodeGroups=[]; 
} 
This.DepthGroup[OrgObj.Depth].Nodes[This.DepthGroup[OrgObj.Depth].Nodes.length]=OrgObj; 
if(OrgObj.Depth==1){ 
This.DepthGroup[OrgObj.Depth].NodeGroups[0]=[]; 
This.DepthGroup[OrgObj.Depth].NodeGroups[0][0]=OrgObj; 
OrgObj.NodeGroupId=0; 
OrgObj.NodeOrderId=0; 
}else{ 
if(This.DepthGroup[OrgObj.Depth].NodeGroups.length==0){ 
This.DepthGroup[OrgObj.Depth].NodeGroups[0]=[]; 
This.DepthGroup[OrgObj.Depth].NodeGroups[0][0]=OrgObj; 
OrgObj.NodeGroupId=0; 
OrgObj.NodeOrderId=0; 
}else{ 
var GroupsLength=This.DepthGroup[OrgObj.Depth].NodeGroups.length; 
var GroupNodesLength=This.DepthGroup[OrgObj.Depth].NodeGroups[GroupsLength-1].length; 
if(OrgObj.parentNode==This.DepthGroup[OrgObj.Depth].NodeGroups[GroupsLength-1][GroupNodesLength-1].parentNode){ 
This.DepthGroup[OrgObj.Depth].NodeGroups[GroupsLength-1][GroupNodesLength]=OrgObj; 
OrgObj.NodeGroupId=GroupsLength-1; 
OrgObj.NodeOrderId=GroupNodesLength; 
}else{ 
if(typeof(This.DepthGroup[OrgObj.Depth].NodeGroups[GroupsLength])!="object"){ 
This.DepthGroup[OrgObj.Depth].NodeGroups[GroupsLength]=[]; 
} 
GroupNodesLength=This.DepthGroup[OrgObj.Depth].NodeGroups[GroupsLength].length; 
This.DepthGroup[OrgObj.Depth].NodeGroups[GroupsLength][GroupNodesLength]=OrgObj; 
OrgObj.NodeGroupId=GroupsLength; 
OrgObj.NodeOrderId=GroupNodesLength; 
} 
} 
} 

if(OrgObj.Nodes.length!=0){ 
for(var n=0; n<OrgObj.Nodes.length; n++){ 
GetDepth(OrgObj.Nodes[n]); 
} 
} 
} 
function BoxInit(OrgObj_){//节点初始化 
OrgObj_.Templet=GetBoxTemplet(); 
OrgObj_.BoxWidth=This.BoxWidth; 
OrgObj_.BoxHeight=This.BoxHeight; 
OrgObj_.inIt(); 

if(OrgObj_.Nodes.length!=0){ 
for(var n=0; n<OrgObj_.Nodes.length; n++){ 
BoxInit(OrgObj_.Nodes[n]); 
} 
} 
} 

function GetBoxTemplet(){//取得节点模板 
if(This.BoxTemplet!=null)return This.BoxTemplet; 
var TempletStr="<div id=\"{Id}\" style=\"font-size:12pt;padding:5px 5px 5px 5px;border:thin solid orange;background-color:lightgrey; clear:left;float:left;text-align:center;position:absolute;" 
if(This.ShowType==2)TempletStr+="writing-mode: tb-rl;"; 
TempletStr+="\" title=\"{Description}\" ><a href=\"{Link}\" target=\"_blank\">{Text}</a></div>"; 
return TempletStr; 
} 

function CreateLine(type_, top_, left_, long_, size_, color_, id_){ 
this.Type=type_; 
top_=top_+""; 
left_=left_+""; 
long_=long_+""; 
this.Top=(top_.substr(top_.length-2).toLowerCase()!="px")?top_+"px":top_; 
this.Left=(left_.substr(left_.length-2).toLowerCase()!="px")?left_+"px":left_; 
this.Long=(long_.substr(long_.length-2).toLowerCase()!="px")?long_+"px":long_; 
this.Size=(size_==undefined)?"1px":size_+""; 
this.Id=(id_==undefined)?null:id_; 
this.Size=(this.Size.substr(this.Size.length-2).toLowerCase()!="px")?this.Size+"px":this.Size; 
this.Color=(color_==undefined)?"#000000":color_; 
this.Line=document.createElement("DIV"); 
document.body.appendChild(this.Line); 
this.Line.innerText="x"; 
this.Line.style.position="absolute"; 
this.Line.style.top=this.Top; 
this.Line.style.left=this.Left; 
this.Line.style.overflow="hidden"; 
if(this.Type==1){ 
this.Line.style.borderTopColor=this.Color; 
this.Line.style.borderTopWidth=this.Size; 
this.Line.style.borderTopStyle="solid"; 
this.Line.style.width=this.Long; 
this.Line.style.height="0px"; 
}else{ 
this.Line.style.borderLeftColor=this.Color; 
this.Line.style.borderLeftWidth=this.Size; 
this.Line.style.borderLeftStyle="solid"; 
this.Line.style.height=this.Long; 
this.Line.style.width="0px"; 
} 
if(this.Id!=null)this.Line.id=this.Id; 
} 
} 
</script> 

</head> 
<body>

<div class="zz"> 
<div id="LoadBox">员工组织结构图正在生成，请不要刷新或者关闭窗口,稍后……</div> 

<%
	PomsCalculateTerminalDevice cons= (PomsCalculateTerminalDevice)request.getAttribute("parentCons");
	List<PomsCalculateTerminalDevice> list =(List<PomsCalculateTerminalDevice>)request.getAttribute("listAll");
%>
</div>
<script language="javascript"> 

var xy0101=new OrgNode(); 
xy0101.id = '<%=cons.getId()%>';
xy0101.parentid = '<%=cons.getPclcParentId()%>';
xy0101.Text='<%=cons.getCdtMeasureLoop()%>'; 
xy0101.Description='<%=cons.getCtdCodes()%>'; 
xy0101.Link="#"; 
var myarray = [];
<%for(int i =0 ;i<list.size();i++){
	PomsCalculateTerminalDevice o = list.get(i);
%>
		var xy=new OrgNode(); 
		xy.id = '<%=o.getId()%>';
		xy.Text='<%=o.getCdtMeasureLoop()%>'; 
		xy.Description='<%=o.getCtdCodes()%>';
		xy.parentid =  '<%=o.getPclcParentId()%>';
		myarray[<%=i%>] =  xy ;
		
<%}%>
		
	/*for(x in myarray){
		var a = myarray[x];
		if(xy0101.id == a.parentid){
				xy0101.Nodes.Add(a);
			}else{
				//put(myarray,a);
				for(y in myarray){
					var b = myarray[y];
					if(a.id ==  b.parentid){
						a.Nodes.Add(b);
					}else{
						for(z in myarray){
							var c = myarray[z];
							if(b.id ==  c.parentid){
								b.Nodes.Add(c);
							}
							}

						}
					}


				
			}
		
		}*/
	put(xy0101,myarray);
	function put(node,arrayown){
		var syc = [] ;
		var ssss = [] ;
		for(z in arrayown){
			var c = arrayown[z];
			if(node.id==c.parentid){//如果
				node.Nodes.Add(c);
				//syc = arrayown.splice(z,1);
				syc.push(c);		
				
				}else {
					ssss.push(c);
					
					}
			}
		abc(syc,ssss);
				//alert(syc.length +" "+ ssss.length);//put(c,syc);
		
			
		}
	function abc(arr1 ,arr2){
		for(z in arr1){
			var c = arr1[z];
			put(c,arr2);
			}
		}
	/*function abc(arr1 ,arr2){
		for(z in arr1){
			var c = arr1[z];
			for(x in arr2){
				var d = arr2[x];

				if(c.id== d.parentid){
					c.Nodes.Add(d);
					}
				}

			}
		}*/
</script> 

<script language="javascript"> 
var OrgShows=new OrgShow(xy0101); 
OrgShows.Top=20; 
OrgShows.Left=20; 
OrgShows.IntervalWidth=100; 
OrgShows.IntervalHeight=20; 
OrgShows.ShowType=1; 
OrgShows.BoxHeight=60; 
OrgShows.BoxWidth='100%';
OrgShows.LineSize=5;  //设置线条大小 
OrgShows.LineColor="#cccccc";  //设置线条颜色 
//OrgShows.BoxTemplet="<div id=\"{Id}\" class=\"OrgBox\"><img src=\"{EmpPhoto}\" /><span>{EmpName}</span><div>{department}</div></div>" 
OrgShows.Run(); 
$("LoadBox").style.display="none"; 
</script> 	    
</body> 

</html> 