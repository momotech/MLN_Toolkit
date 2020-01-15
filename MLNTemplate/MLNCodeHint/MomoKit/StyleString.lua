---
--- Generated by MLN Team (https://www.immomo.com)
--- Created by MLN Team.
--- DateTime: 15-01-2020 17:35
---

---
---  富文本字符串，即带属性的字符串，除了内容之外会携带这些内容的展示样式
---
---@class StyleString @parent class
---@public field name string 
---@type StyleString
local _class = {
	_priveta_class_name = "StyleString"}

---
---  创建富文本字符串
---
---@param str string  传入的普通字符串
---@return StyleString 
function StyleString(str)
	return _class
end

---
---  设置字体名称
---
---@param fontName string  字体名称，如平方字体：PingFangSC-Regular，我们可以通过s = StyleString(); s:fontName('PingFangSC-Regular')语句来设置字体
---@return StyleString 
---@note  Android的这个接口，系统要求api28以上，Android版本8.2以下的手机都不生效
function _class:fontName(fontName)
	return self
end

---
---  给指定内容设置字体
---
---@param fontName string  字体名称，如平方字体：PingFangSC-Regular
---@param index number  指定范围的起始位置索引
---@param length number  指定范围的字符长度
---@return StyleString 
---@note  如果此方法与setFontName同时使用，应先调用fontName方法，并且Android的这个接口，系统要求api28以上，Android版本8.2以下的手机都不生效
function _class:setFontNameForRange(fontName, index, length)
	return self
end

---
---  为指定范围内的字符设置字体大小
---
---@param fontSize number  字体大小
---@param index number  指定范围的起始位置索引, 从1开始
---@param length number  指定范围的字符长度
---@return StyleString 
---@note  如果此方法与setFontSize同时使用，应先调用setFontSize方法
function _class:setFontSizeForRange(fontSize, index, length)
	return self
end

---
---  为字符串设置字体大小
---
---@param fontSize number  字体大小
---@return StyleString 
function _class:fontSize(fontSize)
	return self
end

---
---  字体样式
---
---@param fontStyle FontStyle  字体样式见[FontStyle](FontStyle)
---@return StyleString 
function _class:fontStyle(fontStyle)
	return self
end

---
---  给部分内容设置字体样式
---
---@param fontStyle number  字体样式，见[FontStyle](FontStyle)
---@param index number  指定范围的起始位置索引, 从1开始
---@param length number  指定范围的字符长度
---@return StyleString 
---@note  如果此方法与setFontStyle同时使用，应先调用fontStyle方法
function _class:setFontStyleForRange(fontStyle, index, length)
	return self
end

---
---  字体颜色
---
---@param fontColor Color  颜色：Color(r,g,b,a)具体参见：[Color](Color)
---@return StyleString 
function _class:fontColor(fontColor)
	return self
end

---
---  给部分内容设置颜色
---
---@param fontColor Color  背景颜色：Color(r,g,b,a)具体参见：[Color](Color)
---@param index number  指定范围的起始位置索引, 从1开始
---@param length number  指定范围的字符长度
---@return StyleString 
---@note  如果此方法与fontColor同时使用，应先调用fontColor方法
function _class:setFontColorForRange(fontColor, index, length)
	return self
end

---
---  背景颜色
---
---@param color Color  背景颜色：Color(r,g,b,a)具体参见：[Color](Color)
---@return StyleString 
function _class:backgroundColor(color)
	return self
end

---
---  给部分内容设置背景颜色
---
---@param color Color  背景颜色：Color(r,g,b,a)具体参见：[Color](Color)
---@param index number  指定范围的起始位置索引, 从1开始
---@param length number  指定范围的字符长度
---@return StyleString 
---@note  如果此方法与backgroundColor同时使用，应先调用backgroundColor方法
function _class:setBackgroundColorForRange(color, index, length)
	return self
end

---
---  设置下划线
---
---@param style UnderlineStyle  下划线样式[UnderlineStyle](UnderlineStyle)
---@return StyleString 
---@note  
function _class:underline(style)
	return self
end

---
---  给部分内容设置下划线
---
---@param style UnderlineStyle  下划线样式[UnderlineStyle](UnderlineStyle)
---@param index number  指定范围的起始位置索引, 从1开始
---@param length number  指定范围的字符长度
---@return StyleString 
---@note  如果此方法与underline同时使用，应先调用underline方法
function _class:setUnderlineForRange(style, index, length)
	return self
end

---
---  以Image的形式展示，常用于图文混排
---
---
---  以Image的形式展示，前提是当前内容为图片网络路径或本地路径，且以图片形式展示后，背景色，下划线，字体等样式无法设置
---
---@param size Size  图片大小
---@return boolean 返回图片是否设置成功
---@note  使用场景：用于向字符串中间插入图片进行展示
function _class:showAsImage(size)
	return true
end

---
---  尾部追加StyleString
---
---@param styleString StyleString  追加的富文本字符串
---@return StyleString 
function _class:append(styleString)
	return self
end

---
---  计算显示该内容需要的最小尺寸
---
---@param maxWidth number  限定显示当前内容的最大宽度
---@return Size 返回显示当前内容所需要的最小尺寸(Size)
---@note  此方法在iOS上算的不准，可能导致iOS上 用来设置label宽度时，文字被截断。
---		iOS上建议使用StringUtil:sizeWithContentFontSize方法；
---		另外，如果是用于 label 布局，推荐使用线性布局。
function _class:calculateSize(maxWidth)
	return Size()
end

---
---  设置文本内容
---
---@param content string  文本内容
---@return StyleString 
function _class:setText(content)
	return self
end

return _class