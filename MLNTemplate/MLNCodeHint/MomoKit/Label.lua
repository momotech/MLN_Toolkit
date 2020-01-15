---
--- Generated by MLN Team (https://www.immomo.com)
--- Created by MLN Team.
--- DateTime: 15-01-2020 17:35
---

---
---  文本展示控件
---
---@note  非容器视图，不可以添加子视图。
---		注意：由于iOS Label在固定高度情况下渲染空间不足时，不会渲染剩下的行数，Android会继续渲染并存在截断现象，故，如果出现iOS和Android行数不一致情况，请将高度设置为能够容下足够行数的高度
---@class Label @parent class
---@public field name string 
---@type Label
local _class = {
	_priveta_class_name = "Label"}

---
---  创建文本展示控件
---
---@return Label 
function Label()
	return _class
end

---
---  设置文本内容
---
---@param content string  要展示的文本内容
---@return Label 
function _class:text(content)
	return self
end

---
---  获取当前文本内容
---
---@return string 
function _class:text()
	return "string"
end

---
---  设置文字对齐方式，参见[TextAlign](TextAlign)
---
---@param align TextAlign  文字对齐方式
---@return Label 
function _class:textAlign(align)
	return self
end

---
---  获取文字对齐方式，参见[TextAlign](TextAlign)
---
---@return TextAlign 文字对齐方式，参见[TextAlign](TextAlign)
function _class:textAlign()
	return TextAlign()
end

---
---  设置字体大小
---
---@param size number  文字大小
---@return Label 
function _class:fontSize(size)
	return self
end

---
---  获取字体大小
---
---@return number 
function _class:fontSize()
	return 0
end

---
---  设置文字颜色
---
---@param color Color  文字颜色, 见[Color](Color)
---@return Label 
function _class:textColor(color)
	return self
end

---
---  获取文字颜色
---
---@return Color 文字颜色, 见[Color](Color)
function _class:textColor()
	return Color()
end

---
---  设置展示的最大行数，默认只展示一行
---
---@param num number  最大行数
---@return Label 
---@note  0代表最大行数不限制。当lines传入0时，Label的BreakMode会强制改为Clipping切割模式
function _class:lines(num)
	return self
end

---
---  获取展示的最大行数
---
---@return number 
function _class:lines()
	return 0
end

---
---  设置文字截断样式，参见[BreakMode](BreakMode)的枚举值
---
---@param mode BreakMode  文字截断样式的枚举值
---@return Label 
---@note  在多行情况下，当设置Start或Middle时，会强制改为Clipping切割模式
function _class:breakMode(mode)
	return self
end

---
---  获取文字截断样式，参见[BreakMode](BreakMode)的枚举值
---
---@return BreakMode 
function _class:breakMode()
	return BreakMode()
end

---
---  设置富文本，详情参见[StyleString](StyleString)
---
---@param styleString StyleString  富文本
---@return Label 
---@note  iOS设置该属性会清空之前设置的属性
function _class:styleText(styleString)
	return self
end

---
---  获取富文本，详情参见[StyleString](StyleString)
---
---@return StyleString 
function _class:styleText()
	return StyleString()
end

---
---  设置文字内容距边界距离
---
---@param top number  文字距顶部距离
---@param right number  文字距离右侧距离
---@param bottom number  文字距离底部距离
---@param left number  文字距离左侧距离
---@return Label 
function _class:padding(top, right, bottom, left)
	return self
end

---
---  设置文字粗体
---
---@return Label 
---@note  弃用, 请使用setTextFontStyle方法
function _class:setTextBold()
	return self
end

---
---  设置字体样式
---
---@param style FontStyle  字体样式枚举
---@return Label 
function _class:setTextFontStyle(style)
	return self
end

---
---  设置自定义字体
---
---@param name string  字体名称
---@param size number  字体大小
---@return Label 
function _class:fontNameSize(name, size)
	return self
end

---
---  是否使用文本自适应
---
---@param isFit boolean  是否使用文本自适应，true为自适应，false为不自适应，默认false
---@return Label 
---@note  该已弃用，请使用新布局的WrapContent
function _class:setAutoFit(isFit)
	return self
end

---
---  包裹内容，即大小按照文本内容自适应, setWrapContent(true)与width(MeasurementType.WRAP_CONTENT) && height(MeasurementType.WRAP_CONTENT)等效
---
---@param isWrap boolean  true为自适应，false为不自适应，默认true
---@return Label 
---@note  当label同时设置setWrapContent方法及width(10):height(10)的情况下，展示效果取决于设置的先后顺序。如：当label设置了setWrapContent(true)之后设置width(10):height(10)，label宽度为10、高度为10；当设置width(10):height(10)固定宽高后设置WrapContent,即以setWrapContent设置为准
function _class:setWrapContent(isWrap)
	return self
end

---
---  开启自适应时最大宽度的限制
---
---@param maxWidth number  最大宽度
---@return Label 
---@note  该方法仅在自适应布局下有效, 即width(MeasurementType.WRAP_CONTENT)或width(MeasurementType.MATCH_PARENT)
function _class:setMaxWidth(maxWidth)
	return self
end

---
---  开启自适应时最小宽度的限制
---
---@param minWidth number  最小宽度
---@return Label 
---@note  该方法仅在自适应布局下有效, 即width(MeasurementType.WRAP_CONTENT)或width(MeasurementType.MATCH_PARENT)
function _class:setMinWidth(minWidth)
	return self
end

---
---  开启自适应时最大高度的限制
---
---@param maxHeight number  最大高度
---@return Label 
---@note  该方法仅在自适应布局下有效, 即height(MeasurementType.WRAP_CONTENT)或height(MeasurementType.MATCH_PARENT)
function _class:setMaxHeight(maxHeight)
	return self
end

---
---  开启自适应时最小高度的限制
---
---@param minHeight number  最小高度
---@return Label 
---@note  该方法仅在自适应布局下有效, 即height(MeasurementType.WRAP_CONTENT)或height(MeasurementType.MATCH_PARENT)
function _class:setMinHeight(minHeight)
	return self
end

---
---  设置多行文本之间行间距
---
---@param spacing number  行间的距离
---@return Label 
function _class:setLineSpacing(spacing)
	return self
end

---
---  设置是否在文字上面和下面添加一点额外的padding
---
---@param bool boolean  默认为false
---@return Label 
---@note  仅android有效，ios空实现
function _class:a_setIncludeFontPadding(bool)
	return self
end

---
---  设置视图宽度
---
---
---  view宽度，可设置MeasurementType的枚举值（SDK>=1.0.5）, 默认是MeasurementType.WRAP_CONTENT
---
---@param size number  宽度值
---@return Label 
function _class:width(size)
	return self
end

---
---  获取视图宽度
---
---
---  获取视图的宽度
---
---@return number 浮点数，视图宽度
function _class:width()
	return 0
end

---
---  设置视图高度
---
---
---  view高度，可设置MeasurementType的枚举值（SDK>=1.0.5， 默认是MeasurementType.WRAP_CONTENT
---
---@param size number  高度值
---@return Label 
function _class:height(size)
	return self
end

---
---  获取视图高度
---
---
---  获取视图的高度值
---
---@return number 浮点数，视图高度
function _class:height()
	return 0
end

---
---  设置视图的上外边距
---
---
---  设置视图的上外边距，SDK>=1.0.2，只能在LinearLayout中有用
---
---@param value number  间距值
---@return Label 
function _class:marginTop(value)
	return self
end

---
---  获取视图的上外边距
---
---
---  获取视图的上外边距， SDK>=1.0.2 只能在特殊layout中有用
---
---@return number 间距值
function _class:marginTop()
	return 0
end

---
---  设置视图的左外边距
---
---
---  设置视图的左外边距，SDK>=1.0.2 只能在特殊layout中有用
---
---@param value number  间距值
---@return Label 
function _class:marginLeft(value)
	return self
end

---
---  获取视图的左外边距
---
---
---  获取视图的左外边距，SDK>=1.0.2 只能在特殊layout中有用
---
---@return number 浮点数，间距值
function _class:marginLeft()
	return 0
end

---
---  设置视图的下外边距
---
---
---  获取视图的下外边距，SDK>=1.0.2 只能在特殊layout中有用，具体请参考[Lua基础布局简介](Lua基础布局简介-Step1)
---
---@param value number  间距值
---@return Label 
function _class:marginBottom(value)
	return self
end

---
---  获取视图的下外边距
---
---
---  获取视图的下外边距，SDK>=1.0.2 只能在特殊layout中有用，具体请参考[Lua基础布局简介](Lua基础布局简介-Step1)
---
---@return number 浮点数，间距值
function _class:marginBottom()
	return 0
end

---
---  设置视图的右外边距
---
---
---  设置视图的右外边距，SDK>=1.0.2 只能在特殊layout中有用，具体请参考[Lua基础布局简介](Lua基础布局简介-Step1)
---
---@param value number  间距值
---@return Label 
function _class:marginRight(value)
	return self
end

---
---  获取视图的右外边距
---
---
---  获取视图的右外边距，SDK>=1.0.2 只能在特殊layout中有用，具体请参考[Lua基础布局简介](Lua基础布局简介-Step1)
---
---@return number 浮点数，间距值
function _class:marginRight()
	return 0
end

---
---  约束优先级，范围0-1000
---
---
---  设置约束计算优先级，数值越大越优先计算，占据的可用位置便越大，具体请参考[Lua基础布局简介](Lua基础布局简介-Step1)
---
---@param priority number  范围0-1000
---@return Label 
---@note  只能在LinearLayout中有用
function _class:priority(priority)
	return self
end

---
---  获取约束优先级,范围0-1000
---
---
---  获取约束计算优先级，数值越大越优先计算，占据的可用位置便越大，具体请参考[Lua基础布局简介](Lua基础布局简介-Step1)
---
---@return number 约束优先级
---@note  只能在LinearLayout中有用
function _class:priority()
	return 0
end

---
---  约束权重（百分比），范围0-1000
---
---
---  约束权重（百分比）。当子视图A的Weight为3，B的Weight为4时，则A占容器的3/7，B占容器的4/7。
---
---@param weight number  范围0-1000
---@return Label 
---@note  只能在LinearLayout中有用
function _class:weight(weight)
	return self
end

---
---  获取约束权重（百分比），范围0-1000
---
---
---  获取约束权重（百分比）。
---
---@return number 约束权重
---@note  只能在LinearLayout中有用
function _class:weight()
	return 0
end

---
---  设置视图的内边距
---
---@param top number  top:距顶部的距离
---@param right number  right:距右侧的距离
---@param bottom number  bottom:距底部的距离
---@param left number  left:距左侧的距离
---@return Label 
function _class:padding(top, right, bottom, left)
	return self
end

---
---  设置最大宽度约束
---
---
---  设置最大宽度约束，SDK>=1.1.5,配合自适应使用，当宽度为WRAP_CONTENT或MATCH_PARENT时有效
---
---@param number_a number  约束值
---@return Label 
---@note  配合自适应使用，对于嵌套视图父视图设置该属性，子视图超出父视图范围的情况，可以导致效果和预期不一致，此时需要对父视图使用clipToBounds切割子视图，iOS默认不切割子视图
function _class:setMaxWidth(number_a)
	return self
end

---
---  设置最小宽度约束
---
---
---  设置视图最小宽度约束，SDK>=1.1.5,配合自适应使用，当宽度为WRAP_CONTENT或MATCH_PARENT时有效
---
---@param value number  约束值
---@return Label 
---@note  配合自适应使用，对于嵌套视图父视图设置该属性，子视图超出父视图范围的情况，可以导致效果和预期不一致，此时需要对父视图使用clipToBounds切割子视图，iOS默认不切割子视图
function _class:setMinWidth(value)
	return self
end

---
---  设置最大高度约束
---
---
---  设置视图最大高度约束，SDK>=1.1.5,配合自适应使用，当高度为WRAP_CONTENT或MATCH_PARENT时有效
---
---@param value number  约束值
---@return Label 
---@note  配合自适应使用，对于嵌套视图父视图设置该属性，子视图超出父视图范围的情况，可以导致效果和预期不一致，此时需要对父视图使用clipToBounds切割子视图，iOS默认不切割子视图
function _class:setMaxHeight(value)
	return self
end

---
---  设置最小高度约束
---
---
---  设置视图最小高度约束，SDK>=1.1.5,配合自适应使用，当高度为WRAP_CONTENT或MATCH_PARENT时有效
---
---@param value number  约束值
---@return Label 
---@note  配合自适应使用，对于嵌套视图父视图设置该属性，子视图超出父视图范围的情况，可以导致效果和预期不一致，此时需要对父视图使用clipToBounds切割子视图，iOS默认不切割子视图
function _class:setMinHeight(value)
	return self
end

---
---  返回该视图的父视图对象
---
---
---  返回当前控件的父视图，window返回nil
---
---@return View 父视图
---@note  window返回nil
function _class:superview()
	return View()
end

---
---  添加子视图
---
---
---  将子视图添加到当前视图，该方法只有容器类拥有
---
---@param subView View  任意继承自View的视图实例对象
---@return Label 
function _class:addView(subView)
	return self
end

---
---  将视图插入到当前视图的某一个层级
---
---
---  将视图插入到当前视图的某个层级，该方法只有容器类拥有
---
---@param subView View  子视图
---@param idx number  idx:插入的位置，0为最底部，往上递增
---@return Label 
function _class:insertView(subView, idx)
	return self
end

---
---  从父视图中移除自身
---
---
---  从父视图中移除自身
---
---@return Label 
function _class:removeFromSuper()
	return self
end

---
---  移除当前视图所有的子视图
---
---
---  移除当前视图的所有子视图
---
---@return Label 
function _class:removeAllSubviews()
	return self
end

---
---  坐标转换
---
---
---  将自身的点的坐标换算到参考视图的坐标系中
---
---@param otherView View  参考视图
---@param point Point  被转换的坐标点，来自于自身
---@return Point 转换之后的点，位于参考视图
---@note  被转换的坐标来自于自身
function _class:convertPointTo(otherView, point)
	return Point()
end

---
---  坐标转换
---
---
---  将参考view的点坐标换算到自身的坐标系中
---
---@param otherView View  参考视图
---@param point Point  被转换的坐标点，来自于参考视图
---@return Point 转换后的坐标点，位于自身
---@note  被转换的坐标来自于参考视图
function _class:convertPointFrom(otherView, point)
	return Point()
end

---
---  布局相关
---
---
---  设置当前view吸附状态
---
---@param gravity Gravity  吸附效果，枚举参考[Gravity](Gravity)，布局参考[Lua基础布局简介](Lua基础布局简介-Step1)
---@return Label 
---@note  SDK>=1.0.2 只能在特殊layout中有用，eg: LinearLayout，默认吸附左上角
function _class:setGravity(gravity)
	return self
end

---
---  坐标转换
---
---
---  将自身的点的坐标换算到参考view的坐标中, 在可滚动视图中，与android一致，表现为屏幕上显示的相对坐标
---
---@param otherView View  参考视图
---@param point Point  被转换的点
---@return Point 转换后的点
function _class:convertRelativePointTo(otherView, point)
	return Point()
end

---
---  设置视图透明度，范围 0 ~ 1
---
---@param value number  透明值：0.0~1.0
---@return Label 
---@note  在iOS,当透明度小于0.1之后，将无法响应事件
function _class:alpha(value)
	return self
end

---
---  获取视图透明度
---
---@return number 透明值
function _class:alpha()
	return 0
end

---
---  设置视图是否隐藏，默认为false，不隐藏。该方法隐藏后依然占位，如果不想占位，请使用gone
---
---@param isHidden boolean  是否隐藏，默认false
---@return Label 
function _class:hidden(isHidden)
	return self
end

---
---  获取视图是否隐藏
---
---@return boolean 布尔值
function _class:hidden()
	return true
end

---
---  设置视图是否隐藏,开启后，视图在LinearLayout中将不占位置
---
---
---  设置当前视图是否隐藏且不占位，SDK>=1.2.1,在新布局中有效，hidden方法是隐藏但是占位
---
---@param isGone boolean  是否隐藏,传true隐藏，传false展示
---@return Label 
function _class:gone(isGone)
	return self
end

---
---  获取视图是否隐藏
---
---
---  获取当前视图是否是隐藏且不占位，SDK>=1.2.1,在新布局有效
---
---@return boolean 布尔值，是否隐藏
function _class:gone()
	return true
end

---
---  设置视图的边框宽度
---
---@param value number  边框宽度
---@return Label 
function _class:borderWidth(value)
	return self
end

---
---  获取视图的边框宽度值
---
---@return number 浮点数，视图宽度
function _class:borderWidth()
	return 0
end

---
---  设置视图的边框颜色
---
---@param color Color  颜色，默认为黑色
---@return Label 
function _class:borderColor(color)
	return self
end

---
---  获取视图的边框颜色
---
---@return Color 颜色
function _class:borderColor()
	return Color()
end

---
---  设置视图的背景颜色
---
---@param color Color  颜色
---@return Label 
function _class:bgColor(color)
	return self
end

---
---  获取视图的背景颜色
---
---@return Color 颜色
function _class:bgColor()
	return Color()
end

---
---  设置视图的圆角半径
---
---@param radius number  半径值
---@return Label 
---@note  iOS默认不切割，使用[CornerManager](CornerManager)开启自动切割，调用clipToBounds手动控制是否切割，Android默认切割超出部分
function _class:cornerRadius(radius)
	return self
end

---
---  获取视图的圆角半径,默认返回左上角
---
---@return number 浮点数，半径值
function _class:cornerRadius()
	return 0
end

---
---  设置圆角半径，根据不同的位置
---
---@param radius number  圆角半径
---@param corner RectCorner  TOP_LEFT:左上 TOP_RIGHT:右上 BOTTOM_LEFT:左下 BOTTOM_RIGHT:右下 , @see RectCorner
---@return Label 
---@note  不能与阴影连用
function _class:setCornerRadiusWithDirection(radius, corner)
	return self
end

---
---  根据不同的方向获取视图圆角半径
---
---@param corner RectCorner  TOP_LEFT:左上 TOP_RIGHT:右上 BOTTOM_LEFT:左下 BOTTOM_RIGHT:右下 , @see RectCorner
---@return number 圆角半径，默认返回左上角
function _class:getCornerRadiusWithDirection(corner)
	return 0
end

---
---  设置子视图是否在view的边界内绘制
---
---@param isClip boolean  是否开启边界内绘制
---@return Label 
---@note  Android：clipToBounds只能对parent使用，parent会遍历子View，让所有子View都统一clipToBounds。注：parent自己不生效，需要调用parent的parent才行。
---		IOS：clipToBounds只能对View自己生效
function _class:clipToBounds(isClip)
	return self
end

---
---  设置圆角后，是否切割，默认切割false；优化性能使用
---
---
---  <# nil #
---
---@param noClip boolean  是否切割
---@return Label 
---@note  iOS空实现，仅Android可用，Android sdk1.5.0 默认切割子View。可以改用addCornerMask()绘制圆角遮罩
function _class:notClip(noClip)
	return self
end

---
---  以覆盖一张中间透明周边含有指定颜色圆角的图片的方式实现圆角效果
---
---
---  在iOS上， 切割圆角在一定情况下会触发离屏渲染等问题，在大量圆角且可滚动的页面中，可能会有明显的掉帧体验（低端设备比较明显)，为了优化这种性能问题，所以提供该方案来解决类似的性能问题。
---
---@param cornerRadius number  cornerRadius:圆角半径
---@param maskColor Color  maskColor:圆角遮罩的颜色
---@param corners RectCorner  指定含有圆角的位置，并且可以通过与方式指定多个圆角，具体枚举值见[RectCorner](RectCorner)
---@return Label 
---@note  这是一种提高圆角切割性能的方案，对于子视图超出父视图显示的情况，不建议使用该方式。
function _class:addCornerMask(cornerRadius, maskColor, corners)
	return self
end

---
---  设置线性渐变色
---
---@param startColor Color  start:开始颜色
---@param endColor Color  end:结束颜色
---@param isVertical boolean  vertical：true代表从上到下，false代表从左到右
---@return Label 
function _class:setGradientColor(startColor, endColor, isVertical)
	return self
end

---
---  设置线性渐变色，支持正向反向
---
---@param startColor Color  开始颜色
---@param endColor Color  结束颜色
---@param type GradientType  gradientType：GradientType.LEFT_TO_RIGHT 值为1 代表从左到右， GradientType.RIGHT_TO_LEFT 值为2 代表从右到左， GradientType.TOP_TO_BOTTOM 值为3 代表从上到下，GradientType.BOTTOM_TO_TOP代 值为4 表从下到上
---@return Label 
function _class:setGradientColorWithDirection(startColor, endColor, type)
	return self
end

---
---  设置当前视图是否可以响应用户的点击，触摸等交互事件
---
---@param usable boolean  是否可以用户交互
---@return Label 
---@note  该属性关闭后，不仅会导致自身无法响应事件，而且子视图也无法响应事件。所以当业务中遇到某些控件无法响应，可以考虑是否是自身或父视图禁用了用户交互。
function _class:enabled(usable)
	return self
end

---
---  获取当前视图是否可以响应用户的点击，触摸等交互事件
---
---
---  <# nil #
---
---@return boolean 布尔值
function _class:enabled()
	return true
end

---
---  设置点击事件回调
---
---@param callback fun():void
---	 回调格式：
---		 ``` 
---		 function() 
---		 end 
---		 ```
---@return Label 
---@note  iOS采用的是手势监听，所以要注意事件冲突，在冲突时可使用touchEnd方法
function _class:onClick(callback)
	return self
end

---
---  设置长按回调
---
---@param callback fun():void
---	 回调格式：
---		 ``` 
---		 function() 
---		 end 
---		 ```
---@return Label 
function _class:onLongPress(callback)
	return self
end

---
---  设置有坐标的点击回调
---
---@param callback fun(x:number, y:number):void
---	 回调格式：
---		 ``` 
---		 function(number x,number y) 
---		 	 ---x:x轴坐标 
---		 	 ---y:y轴坐标 
---		 end 
---		 ```
---@return Label 
---@note  已废弃，在需要 回调点击坐标的情况下请结合实际场景使用touchBegin或者touchEnd方法
function _class:onTouch(callback)
	return self
end

---
---  获取是否有焦点
---
---
---  获取当前视图是否有焦点，在iOS端理解为第一响应者
---
---@return boolean true是否焦点
function _class:hasFocus()
	return true
end

---
---  判断是否能获取焦点
---
---
---  获取当前视图是否可以获得焦点
---
---@return boolean true为可以获得焦点
function _class:canFocus()
	return true
end

---
---  获取焦点
---
---
---  请求焦点，即请求成为第一响应者
---
---@return Label 
function _class:requestFocus()
	return self
end

---
---  取消焦点
---
---
---  取消焦点，即取消第一响应者
---
---@return Label 
function _class:cancelFocus()
	return self
end

---
---  触摸开始的回调
---
---
---  设置当触摸开始时的回调，并回调坐标值
---
---@param callback fun(x:number, y:number):void
---	 回调格式：
---		 ``` 
---		 function(number x,number y) 
---		 	 ---x:x轴坐标 
---		 	 ---y:y轴坐标 
---		 end 
---		 ```
---@return Label 
function _class:touchBegin(callback)
	return self
end

---
---  触摸移动中的回调
---
---
---  设置触摸移动中的回调，并回调坐标值
---
---@param callback fun(x:number, y:number):void
---	 回调格式：
---		 ``` 
---		 function(number x,number y) 
---		 	 ---x:x轴坐标 
---		 	 ---y:y轴坐标 
---		 end 
---		 ```
---@return Label 
---@note  该回调会在移动中多次调用
function _class:touchMove(callback)
	return self
end

---
---  触摸结束后的回调
---
---
---  设置触摸结束后的回调，并回调坐标值
---
---@param callback fun(x:number, y:number):void
---	 回调格式：
---		 ``` 
---		 function(number x,number y) 
---		 	 ---x:x轴坐标 
---		 	 ---y:y轴坐标 
---		 end 
---		 ```
---@return Label 
---@note  该坐标是手指抬起时的坐标
function _class:touchEnd(callback)
	return self
end

---
---  触摸取消的回调
---
---
---  设置触摸取消时的回调，并回调坐标值
---
---@param callback fun(x:number, y:number):void
---	 回调格式：
---		 ``` 
---		 function(number x,number y) 
---		 	 ---x:x轴坐标 
---		 	 ---y:y轴坐标 
---		 end 
---		 ```
---@return Label 
---@note  该回调在用户移出当前视图时会调用
function _class:touchCancel(callback)
	return self
end

---
---  触摸开始时的回调
---
---
---  增强版触摸开始时回调，会在回调中返回额外的信息
---
---@param callback fun(map:table):void
---	 回调格式：
---		 ``` 
---		 function(map)  
---		 	 ---map参数如下：
---		 	 ---x:触摸时相对父控件x坐标值 
---		 	 ---y:触摸时相对父控件y坐标值 
---		 	 ---screenX:触摸时相对屏幕x坐标 
---		 	 ---screenY:触摸时相对屏幕Y坐标 
---		 	 ---target:触摸到的view 
---		 	 ---timeStamp:触摸时间（单位s）
---		 end 
---		 ```
---@return Label 
function _class:touchBeginExtension(callback)
	return self
end

---
---  触摸移动时的回调
---
---
---  增强版触摸移动中回调，会在回调中返回额外的信息
---
---@param callback fun(map:table):void
---	 回调格式：
---		 ``` 
---		 function(map)  
---		 	 ---map参数如下：
---		 	 ---x:触摸时相对父控件x坐标值 
---		 	 ---y:触摸时相对父控件y坐标值 
---		 	 ---screenX:触摸时相对屏幕x坐标 
---		 	 ---screenY:触摸时相对屏幕Y坐标 
---		 	 ---target:触摸到的view 
---		 	 ---timeStamp:触摸时间（单位s）
---		 end 
---		 ```
---@return Label 
function _class:touchMoveExtension(callback)
	return self
end

---
---  触摸结束时的回调
---
---
---  增强版触摸结束的回调，会在回调中返回额外的信息
---
---@param callback fun(map:table):void
---	 回调格式：
---		 ``` 
---		 function(map)  
---		 	 ---map参数如下：
---		 	 ---x:触摸时相对父控件x坐标值 
---		 	 ---y:触摸时相对父控件y坐标值 
---		 	 ---screenX:触摸时相对屏幕x坐标 
---		 	 ---screenY:触摸时相对屏幕Y坐标 
---		 	 ---target:触摸到的view 
---		 	 ---timeStamp:触摸时间（单位s）
---		 end 
---		 ```
---@return Label 
function _class:touchEndExtension(callback)
	return self
end

---
---  触摸取消时的回调
---
---
---  增强版触摸取消时的回调，会在回调中返回额外的信息
---
---@param callback fun(map:table):void
---	 回调格式：
---		 ``` 
---		 function(map)  
---		 	 ---map参数如下：
---		 	 ---x:触摸时相对父控件x坐标值 
---		 	 ---y:触摸时相对父控件y坐标值 
---		 	 ---screenX:触摸时相对屏幕x坐标 
---		 	 ---screenY:触摸时相对屏幕Y坐标 
---		 	 ---target:触摸到的view 
---		 	 ---timeStamp:触摸时间（单位s）
---		 end 
---		 ```
---@return Label 
function _class:touchCancelExtension(callback)
	return self
end

---
---  设置是否开启键盘出现后视图自动位移
---
---@param isOpen boolean  是否开启
---@return Label 
---@note  已废弃
function _class:setPositionAdjustForKeyboard(isOpen)
	return self
end

---
---  是否开启键盘出现后视图自动位移，并可设置偏移量
---
---@param isOpen boolean  是否开启
---@param offset number  偏移量
---@return Label 
---@note  已废弃
function _class:setPositionAdjustForKeyboardAndOffset(isOpen, offset)
	return self
end

---
---  锚点，动画作用的位置，从0~1的比例，在视图中对应位置
---
---@param x number  横向位置，范围0~1
---@param y number  竖向位置，范围0~1
---@return Label 
function _class:anchorPoint(x, y)
	return self
end

---
---  旋转视图,可以控制绝对旋转还是叠加旋转
---
---@param rotate number  旋转角度值，0~360
---@param add boolean  是否叠加，默认false
---@return Label 
---@note  已废弃，请使用rotation方法
function _class:transform(rotate, add)
	return self
end

---
---  旋转视图
---
---
---  旋转视图，范围-360~360，默认在视图旋转状态基础上进行叠加旋转
---
---@param rotate number  旋转角度值，0~360
---@param notAdding boolean  基于当前状态，旋转angle弧度 SDK>=1.2.2 ,@notAdding 是否不叠旋转 SDK>=1.5.1
---@return Label 
function _class:rotation(rotate, notAdding)
	return self
end

---
---  缩放视图
---
---
---  设置视图横向和纵向的缩放比例
---
---@param x number  x轴缩放倍数0~max
---@param y number  y轴缩放倍数0~max
---@param add boolean  设置当前视图缩放是否从初始状态开始，默认false在当前视图缩放比例基础上进行缩放
---@return Label 
---@note  参数c是iOS平台隐藏参数，默认不要传
function _class:scale(x, y, add)
	return self
end

---
---  位移视图
---
---
---  设置视图的横向和纵向的偏移量
---
---@param x number  x轴位移量（单位是pt，dp）
---@param y number  y轴位移量（单位是pt，dp）
---@param add boolean  设置当前视图位移是否从初始状态开始，默认false在当前视图位移基础上进行位移
---@return Label 
---@note  参数c是iOS隐藏属性，默认不要传
function _class:translation(x, y, add)
	return self
end

---
---  重置Transform
---
---
---  当我们在设置了Transform属性（rotation，scale，translation）之后想要重置到初始化状态时，可以调用该方法
---
---@return Label 
function _class:transformIdentity()
	return self
end

---
---  移除视图上的帧动画
---
---
---  移除视图上设置过的帧动画，即Animation动画
---
---@return Label 
function _class:removeAllAnimation()
	return self
end

---
---  视图截屏
---
---
---  截图方法，当业务有需要将当前视图的内容保存下来的时候，可以调用该方法进行截图
---
---@param filename string  保存图片的文件名
---@return string 图片路径
---@note  请在界面绘制完毕后，再进行截图操作
function _class:snapshot(filename)
	return "string"
end

---
---  添加高斯模糊
---
---
---  为当前视图增加高斯模糊效果
---
---@return Label 
---@note  iOS有效，Android空实现
function _class:addBlurEffect()
	return self
end

---
---  移除高斯模糊
---
---
---  移除当前视图上增加的高斯模糊效果
---
---@return Label 
---@note  iOS有效，Android空实现
function _class:removeBlurEffect()
	return self
end

---
---  设置点击时的效果
---
---
---  开启视图的高亮点击效果，通常用在cell的点击效果上
---
---@param open boolean  是否打开
---@return Label 
---@note  Android上为波纹效果，iOS上是一种灰色高亮
function _class:openRipple(open)
	return self
end

---
---  设置是否开启点击收起键盘功能
---
---
---  设置是否开启点击收起键盘功能，只能当子视图唤起的键盘，才能触发收起
---
---@param open boolean  是否开启点击取消编辑功能
---@return Label 
function _class:canEndEditing(open)
	return self
end

---
---  将当前视图的子视图移动到所有子视图的最上层
---
---
---  在添加子视图时，默认是新添加的视图在已有的上层，当业务需要将最早添加的视图移动到最上层是，使用该方法
---		
---		⚠️LinearLayout不可使用该方法。️Android不能实现将某个View放入图层下方或上方，View可以做到是通过将子视图加入顺序调换实现，LinearLayout若调换顺序，将导致布局出错
---
---@param subView View  子视图
---@return Label 
---@note  LinearLayout不可使用该方法。️Android不能实现将某个View放入图层下方或上方，View可以做到是通过将子视图加入顺序调换实现，LinearLayout若调换顺序，将导致布局出错
function _class:bringSubviewToFront(subView)
	return self
end

---
---  将子视图放到最下层
---
---
---  在添加子视图是，默认新添加的视图在最上层，当业务需要将新添加的视图移动到最下层时，使用该方法
---		
---		⚠️LinearLayout不可使用该方法。️Android不能实现将某个View放入图层下方或上方，View可以做到是通过将子视图加入顺序调换实现，LinearLayout若调换顺序，将导致布局出错
---
---@param subView View  子视图
---@return Label 
---@note  LinearLayout不可使用该方法。️Android不能实现将某个View放入图层下方或上方，View可以做到是通过将子视图加入顺序调换实现，LinearLayout若调换顺序，将导致布局出错
function _class:sendSubviewToBack(subView)
	return self
end

---
---  给视图设置背景图片
---
---@param imageName string  图片名字，不带后缀
---@return Label 
---@note  背景图片只支持本地资源
function _class:bgImage(imageName)
	return self
end

---
---  给视图添加矩形或圆形阴影
---
---@param shadowColor Color  阴影颜色，Android不可修改
---@param shadowOffset Size  阴影偏移量
---@param shadowRadius number  阴影半径
---@param opacity number  阴影透明度0~1.0
---@param isOval boolean  是否是圆形阴影，默认为false
---@return Label 
function _class:addShadow(shadowColor, shadowOffset, shadowRadius, opacity, isOval)
	return self
end

---
---  设置视图阴影
---
---@param shadowOffset Size  阴影偏移量
---@param shadowRadius number  阴影半径，数值越大，阴影越大，默认3
---@param opacity number  阴影透明度0~1.0
---@return Label 
---@note  1.cornerRadius+Shadow 使用时:
---		 1)不能对同一个View用ClipToBounds()，否则无效;
---		 2)Android 给子View使用Shadow，子View不能充满容器，否则阴影被Parent切割
---		 2.setCornerRadiusWithDirection 禁止与Shadow连用;
---		 3.阴影的View有Z轴高度，会遮挡没有Z轴高度的同层View
---		
function _class:setShadow(shadowOffset, shadowRadius, opacity)
	return self
end

---
---  子视图从父视图移除时的回调
---
---
---  当这个视图从父视图移除，或者当该视图的父视图从祖父视图移除时都会回调
---
---@param callback fun():void
---	 回调格式：
---		 ``` 
---		 function()  
---		  end 
---		 ```
---@return Label 
function _class:onDetachedView(callback)
	return self
end

---
---  开始画布动画(CanvasAnimation)，不会影响布局
---
---@param animation CanvasAnimation  画布动画
---@return Label 
---@note  不可使用FrameAnimation和Animation
function _class:startAnimation(animation)
	return self
end

---
---  停止View里的画布动画
---
---@return Label 
---@note  非画布动画不会停止
function _class:clearAnimation()
	return self
end

return _class