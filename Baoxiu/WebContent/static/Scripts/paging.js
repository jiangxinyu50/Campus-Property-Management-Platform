// JavaScript Document
/**
* js分页类
* @param iAbsolute 每页显示记录数
* @param sTableId 分页表格属性ID值，为String
* @param sTBodyId 分页表格TBODY的属性ID值,为String,此项为要分页的主体内容
* var __variable__; private
* function __method__(){};private
*/
function Page(iAbsolute,sTableId,sTBodyId)
{
this.absolute = iAbsolute; //每页最大记录数
this.tableId = sTableId;
this.tBodyId = sTBodyId;
this.rowCount = 0;//记录数
this.pageCount = 0;//页数
this.pageIndex = 0;//页索引
this.__oTable__ = null;//表格引用
this.__oTBody__ = null;//要分页内容
this.__dataRows__ = 0;//记录行引用
this.__oldTBody__ = null;
this.__init__(); //初始化;
};
/*
初始化
*/
Page.prototype.__init__ = function(){
this.__oTable__ = document.getElementById(this.tableId);//获取table引用
this.__oTBody__ = this.__oTable__.tBodies[this.tBodyId];//获取tBody引用
this.__dataRows__ = this.__oTBody__.rows;//获取tbody的行
this.rowCount = this.__dataRows__.length;//获取tbody的总行数
try{
this.absolute = (this.absolute <= 0) || (this.absolute>this.rowCount) ? this.rowCount : this.absolute; 
//定义初始化时该显示几页数据，也就是总页数
this.pageCount = parseInt(this.rowCount%this.absolute == 0 
? this.rowCount/this.absolute : this.rowCount/this.absolute+1);
}catch(exception){}

this.__updateTableRows__();
};
/*
下一页
*/
Page.prototype.nextPage = function(){
if(this.pageIndex + 1 < this.pageCount){
this.pageIndex += 1;
this.__updateTableRows__();
}
};
/*
上一页
*/
Page.prototype.prePage = function(){
if(this.pageIndex >= 1){
this.pageIndex -= 1;
this.__updateTableRows__();
}
};
/*
首页
*/
Page.prototype.firstPage = function(){
if(this.pageIndex != 0){
this.pageIndex = 0;
this.__updateTableRows__();
} 
};
/*
尾页
*/
Page.prototype.lastPage = function(){
if(this.pageIndex+1 != this.pageCount){
this.pageIndex = this.pageCount - 1;
this.__updateTableRows__();
}
};
/*
页定位方法
*/
Page.prototype.aimPage = function(iPageIndex){
if(iPageIndex > this.pageCount-1){
this.pageIndex = this.pageCount - 1;
}else if(iPageIndex < 0){
this.pageIndex = 0;
}else{
this.pageIndex = iPageIndex;
}
this.__updateTableRows__();
};
/*
执行分页时，更新显示表格内容
*/
Page.prototype.__updateTableRows__ = function(){
//pageIndex初始化时为0
//每页显示的数据*当前页的索引
var iCurrentRowCount = this.absolute * this.pageIndex;
//如果截止到当前页的所有数据+每页显示的数据>总数据条数，则还需要显示this.absolute+ iCurrentRowCount - this.rowCount这些数据，否则，显示0条数据
var iMoreRow = this.absolute+iCurrentRowCount > this.rowCount ? this.absolute+iCurrentRowCount - this.rowCount : 0;
var tempRows = this.__cloneRows__();
//alert(tempRows === this.dataRows);
//alert(this.dataRows.length);
//将tbody从table中移除
var removedTBody = this.__oTable__.removeChild(this.__oTBody__);
//重新创建tbody
var newTBody = document.createElement("TBODY");
//给他赋一个id值，为原来的id值
newTBody.setAttribute("id", this.tBodyId);

for(var i=iCurrentRowCount; i < this.absolute+iCurrentRowCount-iMoreRow; i++){
//重新给body添加节点
newTBody.appendChild(tempRows[i]);
}
//将新创建的tbody加到table中
this.__oTable__.appendChild(newTBody);
/*
this.dataRows为this.oTBody的一个引用，
移除this.oTBody那么this.dataRows引用将销失,
code:this.dataRows = tempRows;恢复原始操作行集合.
*/
this.__dataRows__ = tempRows;
this.__oTBody__ = newTBody;
};
/*
克隆原始操作行集合
*/
Page.prototype.__cloneRows__ = function(){
var tempRows = [];
//将当前body中的所有节点及其子节点都克隆一遍
for(var i=0; i<this.__dataRows__.length; i++){
/*
code:this.dataRows[i].cloneNode(param), 
param = 1 or true:复制以指定节点发展出去的所有节点,
param = 0 or false:只有指定的节点和它的属性被复制.
*/
tempRows[i] = this.__dataRows__[i].cloneNode(1);
}
return tempRows;
};
