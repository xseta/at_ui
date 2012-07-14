local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local UF = E:GetModule('UnitFrames');
local LSM = LibStub("LibSharedMedia-3.0");

local abs = math.abs
local _, ns = ...
local ElvUF = ns.oUF
assert(ElvUF, "ElvUI was unable to locate oUF.")

function UF:GetInfoText(frame, unit, r, g, b, min, max, reverse, type)
	local value
	local db = frame.db
	
	if not db or not db[type] then return '' end

	if db[type].text_format == 'blank' then
		return '';
	end
	
	if reverse then
		if type == 'health' then
			if db[type].text_format == 'current-percent' then
				if min ~= max then
					value = format("|cff%02x%02x%02x%d%%|r |cffD7BEA5-|r |cffAF5050%s|r", r * 255, g * 255, b * 255, floor(min / max * 100), E:ShortValue(min))
				else
					value = format("|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, E:ShortValue(max))	
				end
			elseif db[type].text_format == 'current-max' then
				if min == max then
					value = format("|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, E:ShortValue(max))	
				else
					value = format("|cff%02x%02x%02x%s|r |cffD7BEA5-|r |cffAF5050%s|r", r * 255, g * 255, b * 255, E:ShortValue(max), E:ShortValue(min))
				end
			elseif db[type].text_format == 'current' then
				value = format("|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, E:ShortValue(min))	
			elseif db[type].text_format == 'percent' then
				value = format("|cff%02x%02x%02x%d%%|r", r * 255, g * 255, b * 255, floor(min / max * 100))
			elseif db[type].text_format == 'deficit' then
				if min == max then
					value = ""
				else			
					value = format("|cffAF5050-|r|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, E:ShortValue(max - min))
				end
			end	
		else
			if db[type].text_format == 'current-percent' then
				if min ~= max then
					value = format("%d%% |cffD7BEA5-|r %s", floor(min / max * 100), E:ShortValue(min))
				else
					value = format("%s", E:ShortValue(max))	
				end
			elseif db[type].text_format == 'current-max' then
				if min == max then
					value = format("%s", E:ShortValue(max))	
				else
					value = format("%s |cffD7BEA5-|r %s", E:ShortValue(max), E:ShortValue(min))
				end
			elseif db[type].text_format == 'current' then
				value = format("%s", E:ShortValue(min))	
			elseif db[type].text_format == 'percent' then
				value = format("%d%%", floor(min / max * 100))
			elseif db[type].text_format == 'deficit' then
				if min == max then
					value = ""
				else			
					value = format("|cffAF5050-|r%s", E:ShortValue(max - min))
				end
			end			
		end
	else
		if type == 'health' then
			if db[type].text_format == 'current-percent' then
				if min ~= max then
					value = format("|cffAF5050%s|r |cffD7BEA5-|r |cff%02x%02x%02x%d%%|r", E:ShortValue(min), r * 255, g * 255, b * 255, floor(min / max * 100))
				else
					value = format("|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, E:ShortValue(max))
				end
			elseif db[type].text_format == 'current-max' then
				if min == max then
					value = format("|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, E:ShortValue(max))	
				else
					value = format("|cffAF5050%s|r |cffD7BEA5-|r |cff%02x%02x%02x%s|r", E:ShortValue(min), r * 255, g * 255, b * 255, E:ShortValue(max))
				end
			elseif db[type].text_format == 'current' then
				value = format("|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, E:ShortValue(min))	
			elseif db[type].text_format == 'percent' then
				value = format("|cff%02x%02x%02x%d%%|r", r * 255, g * 255, b * 255, floor(min / max * 100))
			elseif db[type].text_format == 'deficit' then
				if min == max then
					value = ""
				else			
					value = format("|cffAF5050-|r|cff%02x%02x%02x%s|r", r * 255, g * 255, b * 255, E:ShortValue(max - min))
				end
			end
		else
			if db[type].text_format == 'current-percent' then
				if min ~= max then
					value = format("%s |cffD7BEA5-|r %d%%", E:ShortValue(min), floor(min / max * 100))
				else
					value = format("%s", E:ShortValue(max))
				end
			elseif db[type].text_format == 'current-max' then
				if min == max then
					value = format("%s", E:ShortValue(max))	
				else
					value = format("%s |cffD7BEA5-|r %s", E:ShortValue(min), E:ShortValue(max))
				end
			elseif db[type].text_format == 'current' then
				value = format("%s", E:ShortValue(min))	
			elseif db[type].text_format == 'percent' then
				value = format("%d%%", floor(min / max * 100))
			elseif db[type].text_format == 'deficit' then
				if min == max then
					value = ""
				else			
					value = format("|cffAF5050-|r%s", E:ShortValue(max - min))
				end
			end		
		end
	end
	
	return value
end

function UF:PostUpdateHealth(unit, min, max)
	if self:GetParent().isForced then
		min = math.random(1, max)
		self:SetValue(min)
	end

	local r, g, b = self:GetStatusBarColor()
	self.defaultColor = {r, g, b}

	if (E.db['unitframe']['colors'].healthclass == true and E.db['unitframe']['colors'].colorhealthbyvalue == true) or (E.db['unitframe']['colors'].colorhealthbyvalue and self:GetParent().isForced) and not (UnitIsTapped(unit) and not UnitIsTappedByPlayer(unit)) then
		local newr, newg, newb = ElvUF.ColorGradient(min, max, 1, 0, 0, 1, 1, 0, r, g, b)

		self:SetStatusBarColor(newr, newg, newb)
		if self.bg and self.bg.multiplier then
			local mu = self.bg.multiplier
			self.bg:SetVertexColor(newr * mu, newg * mu, newb * mu)
		end
	end

	if E.db['unitframe']['colors'].classbackdrop then
		local t
			if UnitIsPlayer(unit) then
				local _, class = UnitClass(unit)
				t = self:GetParent().colors.class[class]
			elseif UnitReaction(unit, 'player') then
				t = self:GetParent().colors.reaction[UnitReaction(unit, "player")]
			end

		if t then
			self.bg:SetVertexColor(t[1], t[2], t[3])
		end
	end
	
	--Backdrop
	if E.db['unitframe']['colors'].customhealthbackdrop then
		local backdrop = E.db['unitframe']['colors'].health_backdrop
		self.bg:SetVertexColor(backdrop.r, backdrop.g, backdrop.b)		
	end	
	
	if not self.value or self.value and not self.value:IsShown() then return end
	
	local connected, dead, ghost = UnitIsConnected(unit), UnitIsDead(unit), UnitIsGhost(unit)
	if not connected or dead or ghost then
		if not connected then
			self.value:SetText("|cffD7BEA5"..L['Offline'].."|r")
		elseif dead then
			self.value:SetText("|cffD7BEA5"..DEAD.."|r")
		elseif ghost then
			self.value:SetText("|cffD7BEA5"..L['Ghost'].."|r")
		end
		
		if self:GetParent().ResurrectIcon then
			self:GetParent().ResurrectIcon:SetAlpha(1)
		end
	else
		local r, g, b = ElvUF.ColorGradient(min, max, 0.69, 0.31, 0.31, 0.65, 0.63, 0.35, 0.33, 0.59, 0.33)
		local reverse
		if unit == "target" then
			reverse = true
		end
		
		if self:GetParent().ResurrectIcon then
			self:GetParent().ResurrectIcon:SetAlpha(0)
		end
		
		self.value:SetText(UF:GetInfoText(self:GetParent(), unit, r, g, b, min, max, reverse, 'health'))
	end
end

function UF:PostNamePosition(frame, unit)
	if frame.Power.value:GetText() and UnitIsPlayer(unit) and frame.Power.value:IsShown() then
		local db = frame.db
		
		local position = db.name.position
		local x, y = self:GetPositionOffset(position)
		frame.Power.value:SetAlpha(1)
		
		frame.Name:ClearAllPoints()
		frame.Name:Point(position, frame.Health, position, x, y)	
	elseif frame.Power.value:IsShown() then
		frame.Power.value:SetAlpha(0)
		
		frame.Name:ClearAllPoints()
		frame.Name:SetPoint(frame.Power.value:GetPoint())
	end
end

function UF:PostUpdatePower(unit, min, max)
	local pType, pToken, altR, altG, altB = UnitPowerType(unit)
	local color
	
	if self:GetParent().isForced then
		min = math.random(1, max)
		pType = math.random(0, 4)
		pToken = pType == 0 and "MANA" or pType == 1 and "RAGE" or pType == 2 and "FOCUS" or pType == 3 and "ENERGY" or pType == 4 and "RUNIC_POWER"
		self:SetValue(min)
		color = ElvUF['colors'].power[pToken]
		
		if not self.colorClass then
			self:SetStatusBarColor(color[1], color[2], color[3])
			local mu = self.bg.multiplier or 1
			self.bg:SetVertexColor(color[1] * mu, color[2] * mu, color[3] * mu)
		end
	elseif pToken then
		color = ElvUF['colors'].power[pToken]
	end	
	
		
	local perc
	if max == 0 then
		perc = 0
	else
		perc = floor(min / max * 100)
	end
	
	if not self.value or self.value and not self.value:IsShown() then return end		

	if color then
		self.value:SetTextColor(color[1], color[2], color[3])
	else
		self.value:SetTextColor(altR, altG, altB, 1)
	end	
	
	local dead, ghost = UnitIsDead(unit), UnitIsGhost(unit)
	if min == 0 then 
		self.value:SetText() 
	else
		if (not UnitIsPlayer(unit) and not UnitPlayerControlled(unit) or not UnitIsConnected(unit)) and not (unit and unit:find("boss%d")) then
			self.value:SetText()
		elseif dead or ghost then
			self.value:SetText()
		else
			if pType == 0 then
				local reverse
				if unit == "player" then
					reverse = true
				end
				
				self.value:SetText(UF:GetInfoText(self:GetParent(), unit, nil, nil, nil, min, max, reverse, 'power'))
			else
				self.value:SetText(max - (max - min))
			end
		end
	end

	local db = self:GetParent().db
	
	if self.LowManaText and db then
		if pToken == 'MANA' then
			if perc <= db.lowmana and not dead and not ghost then
				self.LowManaText:SetText(LOW..' '..MANA)
				E:Flash(self.LowManaText, 0.6)
			else
				self.LowManaText:SetText()
				E:StopFlash(self.LowManaText)
			end
		else
			self.LowManaText:SetText()
			E:StopFlash(self.LowManaText)
		end
	end
	
	if db and db['power'].hideonnpc then
		UF:PostNamePosition(self:GetParent(), unit)
	end	
end

function UF:PortraitUpdate(unit)
	local db = self:GetParent().db
	
	if not db then return end
	
	if db['portrait'].enable and db['portrait'].overlay then
		self:SetAlpha(0) self:SetAlpha(0.35) 
	else
		self:SetAlpha(1)
	end
	
	if self:GetModel() and self:GetModel().find and self:GetModel():find("worgenmale") then
		self:SetCamera(1)
	end	

	self:SetCamDistanceScale(db['portrait'].camDistanceScale - 0.01 >= 0.01 and db['portrait'].camDistanceScale - 0.01 or 0.01) --Blizzard bug fix
	self:SetCamDistanceScale(db['portrait'].camDistanceScale)
end

local day, hour, minute, second = 86400, 3600, 60, 1
function UF:FormatTime(s, reverse)
	if s >= day then
		return format("%dd", ceil(s / hour))
	elseif s >= hour then
		return format("%dh", ceil(s / hour))
	elseif s >= minute then
		return format("%dm", ceil(s / minute))
	elseif s >= minute / 12 then
		return floor(s)
	end
	
	if reverse and reverse == true and s >= second then
		return floor(s)
	else	
		return format("%.1f", s)
	end
end

function UF:UpdateAuraTimer(elapsed)	
	if self.timeLeft then
		self.elapsed = (self.elapsed or 0) + elapsed
		if self.elapsed >= 0.1 then
			if not self.first then
				self.timeLeft = self.timeLeft - self.elapsed
			else
				self.timeLeft = self.timeLeft - GetTime()
				self.first = false
			end
			if self.timeLeft > 0 then
				local time = UF:FormatTime(self.timeLeft)
				if self.reverse then time = UF:FormatTime(abs(self.timeLeft - self.duration), true) end
				self.text:SetText(time)
				if self.timeLeft <= 5 then
					self.text:SetTextColor(0.99, 0.31, 0.31)
				else
					self.text:SetTextColor(1, 1, 1)
				end
			else
				self.text:Hide()
				self:SetScript("OnUpdate", nil)
			end
			if (not self.isDebuff) and E.db['general'].classtheme == true then
				local r, g, b = self:GetParent():GetParent().Health.backdrop:GetBackdropBorderColor()
				self:SetBackdropBorderColor(r, g, b)
			end
			self.elapsed = 0
		end
	end
end

function UF:PostUpdateAura(unit, button, index, offset, filter, isDebuff, duration, timeLeft)
	local name, _, _, _, dtype, duration, expirationTime, unitCaster, _, _, spellID = UnitAura(unit, index, button.filter)

	local db = self:GetParent().db
	
	button.text:Show()
	if db and db[self.type] then
		button.text:FontTemplate(LSM:Fetch("font", E.db['unitframe'].font), db[self.type].fontsize, 'OUTLINE')
		button.count:FontTemplate(LSM:Fetch("font", E.db['unitframe'].font), db[self.type].fontsize, 'OUTLINE')
	end
	
	if button.isDebuff then
		if(not UnitIsFriend("player", unit) and button.owner ~= "player" and button.owner ~= "vehicle") --[[and (not E.isDebuffWhiteList[name])]] then
			button:SetBackdropBorderColor(unpack(E["media"].bordercolor))
			if unit and not unit:find('arena%d') then
				button.icon:SetDesaturated(true)
			else
				button.icon:SetDesaturated(false)
			end
		else
			local color = DebuffTypeColor[dtype] or DebuffTypeColor.none
			if (name == "Unstable Affliction" or name == "Vampiric Touch") and E.myclass ~= "WARLOCK" then
				button:SetBackdropBorderColor(0.05, 0.85, 0.94)
			else
				button:SetBackdropBorderColor(color.r * 0.6, color.g * 0.6, color.b * 0.6)
			end
			button.icon:SetDesaturated(false)
		end
	else
		if (button.isStealable or ((E.myclass == "PRIEST" or E.myclass == "SHAMAN" or E.myclass == "MAGE") and dtype == "Magic")) and not UnitIsFriend("player", unit) then
			button:SetBackdropBorderColor(237/255, 234/255, 142/255)
		else
			button:SetBackdropBorderColor(unpack(E["media"].bordercolor))		
		end	
	end
	
	button.duration = duration
	button.timeLeft = expirationTime
	button.first = true	
	
	local size = button:GetParent().size
	if size then
		button:Size(size)
	end
	
	--[[if E.ReverseTimer and E.ReverseTimer[spellID] then 
		button.reverse = true 
	else
		button.reverse = nil
	end]]
	
	button:SetScript('OnUpdate', UF.UpdateAuraTimer)
end

function UF:CustomCastDelayText(duration)
	local db = self:GetParent().db
	
	if db then
		local text		
		if self.channeling then
			if db.castbar.format == 'CURRENT' then
				self.Time:SetText(("%.1f |cffaf5050%s %.1f|r"):format(math.abs(duration - self.max), "-", self.delay))
			elseif db.castbar.format == 'CURRENTMAX' then
				self.Time:SetText(("%.1f / %.1f |cffaf5050%s %.1f|r"):format(duration, self.max, "-", self.delay))
			elseif db.castbar.format == 'REMAINING' then
				self.Time:SetText(("%.1f |cffaf5050%s %.1f|r"):format(duration, "-", self.delay))
			end			
		else
			if db.castbar.format == 'CURRENT' then
				self.Time:SetText(("%.1f |cffaf5050%s %.1f|r"):format(duration, "+", self.delay))
			elseif db.castbar.format == 'CURRENTMAX' then
				self.Time:SetText(("%.1f / %.1f |cffaf5050%s %.1f|r"):format(duration, self.max, "+", self.delay))
			elseif db.castbar.format == 'REMAINING' then
				self.Time:SetText(("%.1f |cffaf5050%s %.1f|r"):format(math.abs(duration - self.max), "+", self.delay))
			end		
		end
	end
end

function UF:CustomTimeText(duration)
	local db = self:GetParent().db
	if not db then return end
	
	local text
	if self.channeling then
		if db.castbar.format == 'CURRENT' then
			self.Time:SetText(("%.1f"):format(math.abs(duration - self.max)))
		elseif db.castbar.format == 'CURRENTMAX' then
			self.Time:SetText(("%.1f / %.1f"):format(duration, self.max))
			self.Time:SetText(("%.1f / %.1f"):format(math.abs(duration - self.max), self.max))
		elseif db.castbar.format == 'REMAINING' then
			self.Time:SetText(("%.1f"):format(duration))
		end				
	else
		if db.castbar.format == 'CURRENT' then
			self.Time:SetText(("%.1f"):format(duration))
		elseif db.castbar.format == 'CURRENTMAX' then
			self.Time:SetText(("%.1f / %.1f"):format(duration, self.max))
		elseif db.castbar.format == 'REMAINING' then
			self.Time:SetText(("%.1f"):format(math.abs(duration - self.max)))
		end		
	end
end

local ticks = {}
function UF:HideTicks()
	for _, tick in pairs(ticks) do
		tick:Hide()
	end		
end

function UF:SetCastTicks(frame, numTicks)
	UF:HideTicks()
	if numTicks and numTicks > 0 then
		local d = frame:GetWidth() / numTicks
		for i = 1, numTicks do
			if not ticks[i] then
				ticks[i] = frame:CreateTexture(nil, 'OVERLAY')
				ticks[i]:SetTexture(E["media"].normTex)
				ticks[i]:SetVertexColor(0, 0, 0)
				ticks[i]:SetWidth(1)
				ticks[i]:SetHeight(frame:GetHeight())
			end
			ticks[i]:ClearAllPoints()
			ticks[i]:SetPoint("CENTER", frame, "LEFT", d * i, 0)
			ticks[i]:Show()
		end
	end
end

function UF:PostCastStart(unit, name, rank, castid)
	if unit == "vehicle" then unit = "player" end
	local db = self:GetParent().db

	if db.castbar.displayTarget and self.curTarget then
		self.Text:SetText(string.sub(name..' --> '..self.curTarget, 0, math.floor((((32/245) * self:GetWidth()) / E.db['unitframe'].fontsize) * 12)))
	else
		self.Text:SetText(string.sub(name, 0, math.floor((((32/245) * self:GetWidth()) / E.db['unitframe'].fontsize) * 12)))
	end

	self.Spark:Height(self:GetHeight() * 2)
	
	local color		
	self.unit = unit

	if db.castbar.ticks and unit == "player" then
		local baseTicks = E.global.unitframe.ChannelTicks[name]
		if baseTicks and E.global.unitframe.HastedChannelTicks[name] then
			local tickIncRate = 1 / baseTicks
			local curHaste = UnitSpellHaste("player") * 0.01
			local firstTickInc = tickIncRate / 2
			local bonusTicks = 0
			if curHaste >= firstTickInc then
				bonusTicks = bonusTicks + 1
			end
			
			local x = tonumber(E:Round(firstTickInc + tickIncRate, 2))
			while curHaste >= x do
				x = tonumber(E:Round(firstTickInc + (tickIncRate * bonusTicks), 2))
				if curHaste >= x then
					bonusTicks = bonusTicks + 1
				end
			end

			UF:SetCastTicks(self, baseTicks + bonusTicks)
		elseif baseTicks then
			UF:SetCastTicks(self, baseTicks)
		else
			UF:HideTicks()
		end
	elseif unit == 'player' then
		UF:HideTicks()			
	end	
	
	if self.interrupt and unit ~= "player" then
		if UnitCanAttack("player", unit) then
			color = db['castbar']['interruptcolor']		
			self:SetStatusBarColor(color.r, color.g, color.b)
		else
			color = db['castbar']['color']
			if E.db.theme == 'class' then
				color = RAID_CLASS_COLORS[E.myclass]
			end					
			self:SetStatusBarColor(color.r, color.g, color.b)
		end
	else
		color = db['castbar']['color']
		if E.db.theme == 'class' then
			color = RAID_CLASS_COLORS[E.myclass]
		end				
		self:SetStatusBarColor(color.r, color.g, color.b)
	end
end

function UF:PostCastInterruptible(unit)
	local db = self:GetParent().db
	
	if not db then return end
	
	if unit == "vehicle" then unit = "player" end
	if unit ~= "player" then
		local color
		if UnitCanAttack("player", unit) then
			color = db['castbar'].interruptcolor
		else
			color = db['castbar'].color
		end		
		self:SetStatusBarColor(color.r, color.g, color.b)
	end
end

function UF:PostCastNotInterruptible(unit)
	local db = self:GetParent().db
	
	local color = db['castbar'].interruptcolor
	self:SetStatusBarColor(color.r, color.g, color.b)
end

function UF:UpdateHoly(event, unit, powerType)
	if(self.unit ~= unit or (powerType and powerType ~= 'HOLY_POWER')) then return end
	local db = self.db

	local numHolyPower = UnitPower('player', SPELL_POWER_HOLY_POWER);
	local maxHolyPower = UnitPowerMax('player', SPELL_POWER_HOLY_POWER);	
	
	for i = 1, maxHolyPower do
		if(i <= numHolyPower) then
			self.HolyPower[i]:SetAlpha(1)
			
			if i == 3 and db.classbar.fill == 'spaced' then
				for h = 1, maxHolyPower do
					self.HolyPower[h].backdrop.shadow:Show()
					self.HolyPower[h]:SetScript('OnUpdate', function(self)
						E:Flash(self.backdrop.shadow, 0.6)
					end)
				end
			else
				for h = 1, maxHolyPower do
					self.HolyPower[h].backdrop.shadow:Hide()
					self.HolyPower[h]:SetScript('OnUpdate', nil)
				end
			end
		else
			self.HolyPower[i]:SetAlpha(.2)
			for h = 1, maxHolyPower do
				self.HolyPower[h].backdrop.shadow:Hide()
				self.HolyPower[h]:SetScript('OnUpdate', nil)
			end		
		end
	end
end	

function UF:UpdateShadowOrbs(event, unit, powerType)
	local frame = self:GetParent()
	local db = frame.db
		
	local point, _, anchorPoint, x, y = frame.Health:GetPoint()
	if self:IsShown() and point then
		if db.classbar.fill == 'spaced' then
			frame.Health:SetPoint(point, frame, anchorPoint, x, -7)
		else
			frame.Health:SetPoint(point, frame, anchorPoint, x, -13)
		end
	elseif point then
		frame.Health:SetPoint(point, frame, anchorPoint, x, -2)
	end
	
	UF:UpdatePlayerFrameAnchors(frame, self:IsShown())
end	

function UF:UpdateHarmony()
	local maxBars = self.numPoints
	local frame = self:GetParent()
	local db = frame.db
	if not db then return; end
	
	local UNIT_WIDTH = db.width
	local CLASSBAR_WIDTH = db.width - 4
	local BORDER = 2
	local SPACING = 1
	local USE_PORTRAIT = db.portrait.enable
	local USE_PORTRAIT_OVERLAY = db.portrait.overlay and USE_PORTRAIT
	local PORTRAIT_WIDTH = db.portrait.width
	local POWERBAR_OFFSET = db.power.offset
	local USE_POWERBAR = db.power.enable
	local USE_MINI_POWERBAR = db.power.width ~= 'fill' and USE_POWERBAR
	local USE_POWERBAR_OFFSET = db.power.offset ~= 0 and USE_POWERBAR
	
	if USE_PORTRAIT_OVERLAY or not USE_PORTRAIT then
		PORTRAIT_WIDTH = 0	
	end
	
	if USE_PORTRAIT then
		CLASSBAR_WIDTH = math.ceil((UNIT_WIDTH - (BORDER*2)) - PORTRAIT_WIDTH)
	end
	
	if USE_POWERBAR_OFFSET then
		CLASSBAR_WIDTH = CLASSBAR_WIDTH - POWERBAR_OFFSET
	end	
	
	if db.classbar.fill == 'spaced' then
		SPACING = 9
		
		CLASSBAR_WIDTH = CLASSBAR_WIDTH * (maxBars - 1) / maxBars
	end
	
	for i=1, UF['classMaxResourceBar'][E.myclass] do
		if self[i]:IsShown() and db.classbar.fill == 'spaced' then
			self[i].backdrop:Show()
		else
			self[i].backdrop:Hide()
		end
	end
	
	self:SetWidth(CLASSBAR_WIDTH)
	
	for i = 1, maxBars do		
		self[i]:SetHeight(self:GetHeight())	
		if db.classbar.fill == 'spaced' then
			self[i]:SetWidth(E:Scale(self:GetWidth() - 3)/maxBars)	
		else
			self[i]:SetWidth(E:Scale(self:GetWidth() - 4)/maxBars)	
		end
		self[i]:ClearAllPoints()
		if i == 1 then
			if maxBars == 5 and db.classbar.fill == 'spaced' then
				self[i]:SetPoint("LEFT", self, 'LEFT', -(SPACING/2), 0)
			else
				self[i]:SetPoint("LEFT", self)
			end
		else
			self[i]:Point("LEFT", self[i-1], "RIGHT", SPACING , 0)
		end		
	end	
end

function UF:UpdateShardBar(spec)
	local maxBars = self.number
	local db = self:GetParent().db
	local frame = self:GetParent()
	
	for i=1, UF['classMaxResourceBar'][E.myclass] do
		if self[i]:IsShown() and db.classbar.fill == 'spaced' then
			self[i].backdrop:Show()
		else
			self[i].backdrop:Hide()
		end
	end

	if db.classbar.fill == 'spaced' and maxBars == 1 then
		self:ClearAllPoints()
		self:Point("LEFT", frame.Health.backdrop, "TOPLEFT", 8, 0)
	elseif db.classbar.fill == 'spaced' then
		self:ClearAllPoints()
		self:Point("CENTER", frame.Health.backdrop, "TOP", -12, -2)
	end
	
	local SPACING = 1
	if db.classbar.fill == 'spaced' then
		SPACING = 13
	end
	
	for i = 1, maxBars do
		self[i]:SetHeight(self:GetHeight())	
		self[i]:SetWidth(E:Scale(self:GetWidth() - 2)/maxBars)	
		self[i]:ClearAllPoints()
		if i == 1 then
			self[i]:SetPoint("LEFT", self)
		else
			self[i]:Point("LEFT", self[i-1], "RIGHT", SPACING , 0)
		end		
	end
	
	UF:UpdatePlayerFrameAnchors(frame, self:IsShown())
end

function UF:EclipseDirection()
	local direction = GetEclipseDirection()
	if direction == "sun" then
		self.Text:SetText(">")
		self.Text:SetTextColor(.2,.2,1,1)
	elseif direction == "moon" then
		self.Text:SetText("<")
		self.Text:SetTextColor(1,1,.3, 1)
	else
		self.Text:SetText("")
	end
end

function UF:DruidResourceBarVisibilityUpdate(unit)
	local eclipseBar = self:GetParent().EclipseBar
	local druidAltMana = self:GetParent().DruidAltMana
	
	UF:UpdatePlayerFrameAnchors(self:GetParent(), eclipseBar:IsShown() or druidAltMana:IsShown())
end

function UF:DruidPostUpdateAltPower(unit, min, max)
	local powerText = self:GetParent().Power.value
	
	if min ~= max then
		local color = ElvUF['colors'].power['MANA']
		color = E:RGBToHex(color[1], color[2], color[3])
		
		self.Text:ClearAllPoints()
		if powerText:GetText() then
			if select(4, powerText:GetPoint()) < 0 then
				self.Text:SetPoint("RIGHT", powerText, "LEFT", 3, 0)
				self.Text:SetFormattedText(color.."%d%%|r |cffD7BEA5- |r", floor(min / max * 100))			
			else
				self.Text:SetPoint("LEFT", powerText, "RIGHT", -3, 0)
				self.Text:SetFormattedText("|cffD7BEA5-|r"..color.." %d%%|r", floor(min / max * 100))
			end
		else
			self.Text:SetPoint(powerText:GetPoint())
			self.Text:SetFormattedText(color.."%d%%|r", floor(min / max * 100))
		end	
	else
		self.Text:SetText()
	end
end

function UF:UpdatePvPText(frame)
	local unit = frame.unit
	local PvPText = frame.PvPText
	local LowManaText = frame.Power.LowManaText
	
	if PvPText and frame:IsMouseOver() then
		PvPText:Show()
		if LowManaText and LowManaText:IsShown() then LowManaText:Hide() end
		
		local time = GetPVPTimer()
		local min = format("%01.f", floor((time / 1000) / 60))
		local sec = format("%02.f", floor((time / 1000) - min * 60)) 
		
		if(UnitIsPVPFreeForAll(unit)) then
			if time ~= 301000 and time ~= -1 then
				PvPText:SetText(PVP.." ".."("..min..":"..sec..")")
			else
				PvPText:SetText(PVP)
			end
		elseif UnitIsPVP(unit) then
			if time ~= 301000 and time ~= -1 then
				PvPText:SetText(PVP.." ".."("..min..":"..sec..")")
			else
				PvPText:SetText(PVP)
			end
		else
			PvPText:SetText("")
		end
	elseif PvPText then
		PvPText:Hide()
		if LowManaText and not LowManaText:IsShown() then LowManaText:Show() end
	end
end

function UF:UpdateThreat(event, unit)
	if (self.unit ~= unit) or not unit or not E.initialized then return end
	local status = UnitThreatSituation(unit)
	
	if status and status > 1 then
		local r, g, b = GetThreatStatusColor(status)
		if self.Threat and self.Threat:GetBackdrop() then
			self.Threat:Show()
			self.Threat:SetBackdropBorderColor(r, g, b)
		elseif self.Health.backdrop then
			self.Health.backdrop:SetBackdropBorderColor(r, g, b)
			
			if self.Power and self.Power.backdrop then
				self.Power.backdrop:SetBackdropBorderColor(r, g, b)
			end
		end
	else
		if self.Threat and self.Threat:GetBackdrop() then
			self.Threat:Hide()
		elseif self.Health.backdrop then
			self.Health.backdrop:SetTemplate("Default")
			
			if self.Power and self.Power.backdrop then
				self.Power.backdrop:SetTemplate("Default")
			end
		end	
	end
end

function UF:UpdateTargetGlow(event)
	if not self.unit then return; end
	local unit = self.unit
	
	if UnitIsUnit(unit, 'target') then
		self.TargetGlow:Show()
		local reaction = UnitReaction(unit, 'player')
		
		if UnitIsPlayer(unit) then
			local _, class = UnitClass(unit)
			if class then
				local color = RAID_CLASS_COLORS[class]
				self.TargetGlow:SetBackdropBorderColor(color.r, color.g, color.b)
			else
				self.TargetGlow:SetBackdropBorderColor(1, 1, 1)
			end
		elseif reaction then
			local color = FACTION_BAR_COLORS[reaction]
			self.TargetGlow:SetBackdropBorderColor(color.r, color.g, color.b)
		else
			self.TargetGlow:SetBackdropBorderColor(1, 1, 1)
		end
	else
		self.TargetGlow:Hide()
	end
end

function UF:AltPowerBarPostUpdate(min, cur, max)
	local perc = math.floor((cur/max)*100)
	
	if perc < 35 then
		self:SetStatusBarColor(0, 1, 0)
	elseif perc < 70 then
		self:SetStatusBarColor(1, 1, 0)
	else
		self:SetStatusBarColor(1, 0, 0)
	end
	
	local unit = self:GetParent().unit
	
	if unit == "player" and self.text then 
		local type = select(10, UnitAlternatePowerInfo(unit))
				
		if perc > 0 then
			self.text:SetText(type..": "..format("%d%%", perc))
		else
			self.text:SetText(type..": 0%")
		end
	elseif unit and unit:find("boss%d") and self.text then
		self.text:SetTextColor(self:GetStatusBarColor())
		if not self:GetParent().Power.value:GetText() or self:GetParent().Power.value:GetText() == "" then
			self.text:Point("BOTTOMRIGHT", self:GetParent().Health, "BOTTOMRIGHT")
		else
			self.text:Point("RIGHT", self:GetParent().Power.value.value, "LEFT", 2, E.mult)	
		end
		if perc > 0 then
			self.text:SetText("|cffD7BEA5[|r"..format("%d%%", perc).."|cffD7BEA5]|r")
		else
			self.text:SetText(nil)
		end
	end
end

function UF:UpdateComboDisplay(event, unit)
	if(unit == 'pet') then return end
	local db = UF.player.db
	local cpoints = self.CPoints
	local cp
	if (UnitHasVehicleUI("player") or UnitHasVehicleUI("vehicle")) then
		cp = GetComboPoints('vehicle', 'target')
	else
		cp = GetComboPoints('player', 'target')
	end


	for i=1, MAX_COMBO_POINTS do
		if(i <= cp) then
			cpoints[i]:SetAlpha(1)
			
			if i == MAX_COMBO_POINTS and db.classbar.fill == 'spaced' then
				for c = 1, MAX_COMBO_POINTS do
					cpoints[c].backdrop.shadow:Show()
					cpoints[c]:SetScript('OnUpdate', function(self)
						E:Flash(self.backdrop.shadow, 0.6)
					end)
				end
			else
				for c = 1, MAX_COMBO_POINTS do
					cpoints[c].backdrop.shadow:Hide()
					cpoints[c]:SetScript('OnUpdate', nil)
				end
			end
		else
			cpoints[i]:SetAlpha(.15)
			for c = 1, MAX_COMBO_POINTS do
				cpoints[c].backdrop.shadow:Hide()
				cpoints[c]:SetScript('OnUpdate', nil)
			end		
		end	
	end
	
	local BORDER = E:Scale(2)
	local SPACING = E:Scale(1)
	local db = E.db['unitframe']['units'].target
	local USE_COMBOBAR = db.combobar.enable
	local USE_MINI_COMBOBAR = db.combobar.fill == "spaced" and USE_COMBOBAR
	local COMBOBAR_HEIGHT = db.combobar.height
	local USE_PORTRAIT = db.portrait.enable
	local USE_PORTRAIT_OVERLAY = db.portrait.overlay and USE_PORTRAIT	
	local PORTRAIT_WIDTH = db.portrait.width
	

	if USE_PORTRAIT_OVERLAY or not USE_PORTRAIT then
		PORTRAIT_WIDTH = 0
	end
	
	if cpoints[1]:GetAlpha() == 1 then
		cpoints:Show()
		if USE_MINI_COMBOBAR then
			self.Portrait.backdrop:SetPoint("TOPRIGHT", self, "TOPRIGHT", 0, -((COMBOBAR_HEIGHT/2) + SPACING - BORDER))
			self.Health:Point("TOPRIGHT", self, "TOPRIGHT", -(BORDER+PORTRAIT_WIDTH), -(SPACING + (COMBOBAR_HEIGHT/2)))
		else
			self.Portrait.backdrop:SetPoint("TOPRIGHT", self, "TOPRIGHT")
			self.Health:Point("TOPRIGHT", self, "TOPRIGHT", -(BORDER+PORTRAIT_WIDTH), -(BORDER + SPACING + COMBOBAR_HEIGHT))
		end		

	else
		cpoints:Hide()
		self.Portrait.backdrop:SetPoint("TOPRIGHT", self, "TOPRIGHT")
		self.Health:Point("TOPRIGHT", self, "TOPRIGHT", -(BORDER+PORTRAIT_WIDTH), -BORDER)
	end
end

function UF:AuraFilter(unit, icon, name, rank, texture, count, dtype, duration, timeLeft, caster)	
	local isPlayer, isFriend

	local db = self:GetParent().db

	if(caster == 'player' or caster == 'vehicle') then
		isPlayer = true
	end
	
	if UnitIsFriend('player', unit) then
		isFriend = true
	end
	
	icon.isPlayer = isPlayer
	icon.owner = caster

	if db and db[self.type] and db[self.type].durationLimit ~= 0 and db[self.type].durationLimit ~= nil and duration ~= nil then
		if duration > db[self.type].durationLimit or duration == 0 then
			return false
		end
	end
	
	if db and db[self.type] and db[self.type].showPlayerOnly and isPlayer then
		return true
	elseif db and db[self.type] and db[self.type].useFilter and E.global['unitframe']['aurafilters'][db[self.type].useFilter] then
		local type = E.global['unitframe']['aurafilters'][db[self.type].useFilter].type
		local spellList = E.global['unitframe']['aurafilters'][db[self.type].useFilter].spells
		
		--Prevent filtering on friendly target's debuffs.
		if (unit:find('target') or unit == 'focus') and isFriend and self.type == 'debuffs' and type == 'Whitelist' then
			return true
		end
		
		if type == 'Whitelist' then
			if spellList[name] and spellList[name].enable then
				return true
			else
				return false
			end		
		elseif type == 'Blacklist' then
			if spellList[name] and spellList[name].enable then
				return false
			else
				return true
			end				
		end
	elseif db and db[self.type] then
		if db and not db[self.type].showPlayerOnly then
			return true
		else
			return false
		end
	end	
	
	return true
end

local counterOffsets = {
	['TOPLEFT'] = {6, 1},
	['TOPRIGHT'] = {-6, 1},
	['BOTTOMLEFT'] = {6, 1},
	['BOTTOMRIGHT'] = {-6, 1},
	['LEFT'] = {6, 1},
	['RIGHT'] = {-6, 1},
	['TOP'] = {0, 0},
	['BOTTOM'] = {0, 0},
}

function UF:UpdateAuraWatch(frame)
	local buffs = {};
	local auras = frame.AuraWatch;
	local db = frame.db.buffIndicator;
	
	if not E.global['unitframe'].buffwatch[E.myclass] then E.global['unitframe'].buffwatch[E.myclass] = {} end
	for _, value in pairs(E.global['unitframe'].buffwatch[E.myclass]) do
		tinsert(buffs, value);
	end
	
	for _, spell in pairs(buffs) do
		local icon;
		if spell["id"] then
			local name, _, image = GetSpellInfo(spell["id"]);
			if not auras.icons[spell.id] then
				icon = CreateFrame("Frame", nil, auras);
			else
				icon = auras.icons[spell.id];
			end
			icon.name = name
			icon.image = image
			icon.spellID = spell["id"];
			icon.anyUnit = spell["anyUnit"];
			icon.onlyShowMissing = spell["onlyShowMissing"];
			if spell["onlyShowMissing"] then
				icon.presentAlpha = 0;
				icon.missingAlpha = 1;
			else
				icon.presentAlpha = 1;
				icon.missingAlpha = 0;		
			end		
			icon:Width(db.size);
			icon:Height(db.size);
			icon:ClearAllPoints()
			icon:SetPoint(spell["point"], 0, 0);

			if not icon.icon then
				icon.icon = icon:CreateTexture(nil, "OVERLAY");
				icon.icon:SetAllPoints(icon);
			end
			
			if db.colorIcons then
				icon.icon:SetDrawLayer('OVERLAY');
				icon.icon:SetTexture(E["media"].blankTex);
				
				if (spell["color"]) then
					icon.icon:SetVertexColor(spell["color"].r, spell["color"].g, spell["color"].b);
				else
					icon.icon:SetVertexColor(0.8, 0.8, 0.8);
				end			
			else
				icon.icon:SetDrawLayer('ARTWORK');
				icon.icon:SetTexCoord(.18, .82, .18, .82);
				icon.icon:SetTexture(icon.image);
			end
			
			if not icon.cd then
				icon.cd = CreateFrame("Cooldown", nil, icon)
				icon.cd:SetAllPoints(icon)
				icon.cd:SetReverse(true)
			end
			
			if not icon.border then
				icon.border = icon:CreateTexture(nil, "BACKGROUND");
				icon.border:Point("TOPLEFT", -E.mult, E.mult);
				icon.border:Point("BOTTOMRIGHT", E.mult, -E.mult);
				icon.border:SetTexture(E["media"].blankTex);
				icon.border:SetVertexColor(0, 0, 0);
			end
			
			if not icon.count then
				icon.count = icon:CreateFontString(nil, "OVERLAY", 7);
				icon.count:SetPoint("CENTER", unpack(counterOffsets[spell["point"]]));
			end
			icon.count:FontTemplate(LSM:Fetch("font", E.db['unitframe'].font), db.fontsize, 'OUTLINE');
			
			if spell["enabled"] then
				auras.icons[spell.id] = icon;
				if auras.watched then
					auras.watched[name..image] = icon;
				end
			else	
				auras.icons[spell.id] = nil;
				if auras.watched then
					auras.watched[name..image] = nil;
				end
				icon:Hide();
				icon = nil;
			end
		end
	end
	
	buffs = nil;
end

function UF:UpdateRoleIcon()
	local lfdrole = self.LFDRole
	local db = self.db.roleIcon;
	
	if not db then return; end
	local role = UnitGroupRolesAssigned(self.unit)

	if self.isForced then
		local rnd = math.random(1, 3)
		role = rnd == 1 and "TANK" or (rnd == 2 and "HEALER" or (rnd == 3 and "DAMAGER"))
	end
	
	if(role == 'TANK' or role == 'HEALER' or role == 'DAMAGER') and (UnitIsConnected(self.unit) or self.isForced) and db.enable then
		if role == 'TANK' then
			lfdrole:SetTexture([[Interface\AddOns\ElvUI\media\textures\tank.tga]])
		elseif role == 'HEALER' then
			lfdrole:SetTexture([[Interface\AddOns\ElvUI\media\textures\healer.tga]])
		elseif role == 'DAMAGER' then
			lfdrole:SetTexture([[Interface\AddOns\ElvUI\media\textures\dps.tga]])
		end
		
		lfdrole:Show()
	else
		lfdrole:Hide()
	end	
end

function UF:RaidRoleUpdate()
	local anchor = self:GetParent()
	local leader = anchor:GetParent().Leader
	local masterLooter = anchor:GetParent().MasterLooter

	if not leader or not masterLooter then return; end

	local unit = anchor:GetParent().unit
	local db = anchor:GetParent().db
	local isLeader = leader:IsShown()
	local isMasterLooter = masterLooter:IsShown()
	
	leader:ClearAllPoints()
	masterLooter:ClearAllPoints()
	
	if db and db.raidRoleIcons then
		if isLeader and db.raidRoleIcons.position == 'TOPLEFT' then
			leader:Point('LEFT', anchor, 'LEFT')
			masterLooter:Point('RIGHT', anchor, 'RIGHT')
		elseif isLeader and db.raidRoleIcons.position == 'TOPRIGHT' then
			leader:Point('RIGHT', anchor, 'RIGHT')
			masterLooter:Point('LEFT', anchor, 'LEFT')	
		elseif isMasterLooter and db.raidRoleIcons.position == 'TOPLEFT' then
			masterLooter:Point('LEFT', anchor, 'LEFT')	
		else
			masterLooter:Point('RIGHT', anchor, 'RIGHT')
		end
	end
end

local function CheckFilterArguement(option, optionArgs)
	if option ~= true then
		return true
	end

	return optionArgs
end

function UF:AuraBarFilter(unit, name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate)
	local db = self.db.aurabar
	
	if not db then return; end
	
	--Remove this when beta is done, database correction for my personal error
	if E.global['unitframe']['aurafilters']['DebuffBlacklist']['spells'][name] and type(E.global['unitframe']['aurafilters']['DebuffBlacklist']['spells'][name]) ~= 'table' then
		E.global['unitframe']['aurafilters']['DebuffBlacklist']['spells'][name] = {
			['enable'] = true,
			['priority'] = 0,			
		}	
	end
	
	if E.global['unitframe']['aurafilters']['DebuffBlacklist']['spells'][name] and E.global['unitframe']['aurafilters']['DebuffBlacklist']['spells'][name].enable then
		return false
	end
	
	local isFriend
	if UnitIsFriend('player', unit) then
		isFriend = true
	end
		
	local isWhitelist = E.global['unitframe']['aurafilters']['AuraBars']['spells'][name] and E.global['unitframe']['aurafilters']['AuraBars']['spells'][name].enable
	local isPlayer = unitCaster == 'player' or unitCaster == 'pet' or unitCaster == 'vehicle'
	local durationCheck = CheckFilterArguement(not db.noDuration, duration ~= 0 or isWhitelist)
	local consolidatedCheck = CheckFilterArguement(db.noConsolidated, not shouldConsolidate or isWhitelist);

	if unit == 'player' then
		if (isPlayer or isWhitelist) and consolidatedCheck and durationCheck then
			return true
		end
	else
		if (isFriend or isWhitelist) and consolidatedCheck and isPlayer and durationCheck then
			return true
		elseif not isFriend and isPlayer and durationCheck then
			return true
		end
	end
end