IncludeFile("Lib\\TOIR_SDK.lua")

Ashe = Class()

function OnLoad()
    if GetChampName(GetMyChamp()) == "Ashe" then
        Ashe:ashevadia() -- ashevadia = :__init
    end
end

function Ashe:ashevadia()
    SetLuaCombo(true) -- Desativa a Ashe Interna
    SetLuaHarass(true)
    SetLuaLaneClear(true)

    self.Q = Spell(_Q, GetTrueAttackRange()) --ou , 600 que é o range do AA
    self.W = Spell(_W, 1200)
    self.E = Spell(_E, math.huge) --_Skill, Range da skill - math.huge=global
    self.R = Spell(_R, math.huge)

    self.Q:SetTargetted() -- variação das spells se é skill shot ou outro type
    self.W:SetSkillShot(0.25, 1500, 20, true) -- delay=0.25,speed=1600,width=130,colision inimigo/ minion/ o que parar ela = true
    self.E:SetSkillShot(0.25, 1400, 300, true)
    self.R:SetSkillShot(0.25, 1600, 130, true)

    self:MenuAsheVadia()
    Callback.Add("DrawMenu", function(...) self:OnDrawMenu(...) end)

    Callback.Add("Tick", function(...) self:OnTick(...) end)

end

function Ashe:OnTick() -- on tick = Momento ligado
    
    if (IsDead(myHero.Addr) or myHero.IsRecall or IsTyping() or IsDodging()) then return end  -- n faz nada enquanto nessas situações

    
end

function Ashe:MenuAsheVadia() -- Declara o menu
    self.menu=  "Ashe Vadia" -- Nome do menu
        --Menu Combo--
    self.CQ = self:MenuBool("Combo Q", true)
    self.CW = self:MenuBool("Combo W", true)
    self.CR = self:MenuBool("Combo R", true)

        --Menu Lane Clear--
    self.LQ = self:MenuBool("Lane Q", true)
    self.LW = self:MenuBool("Lane W", true)
    self.LR = self:MenuBool("Lane R", false)

        -- KS --
    self.KW = self:MenuBool("KillSteal > W", true)
    self.KR = self:MenuBool("KillSteal > R", true)

        -- Draw --
    self.DQWER = self:MenuBool("Draw On/Off", false)
    self._Draw_W = self:MenuBool("Draw W", true)

end


function Ashe:OnDrawMenu() -- função para desenhar o menu
    if Menu_Begin(self.menu) then
    end
end



function Ashe:MenuBool(stringKey, bool) -- Funções do menu, tem que ficar no fianl de tudo
    return ReadIniBoolean(self.menu, stringKey, bool)
end

function Ashe:MenuSliderInt(stringKey, valueDefault)
    return ReadIniInteger(self.menu, stringKey, valueDefault)
end

function Ashe:MenuSliderFloat(stringKey, valueDefault)
    return ReadIniFloat(self.menu, stringKey, valueDefault)
end

function Ashe:MenuComboBox(stringKey, valueDefault)
    return ReadIniInteger(self.menu, stringKey, valueDefault)
end

function Ashe:MenuKeyBinding(stringKey, valueDefault)-- até aqui
    return ReadIniInteger(self.menu, stringKey, valueDefault)
end
