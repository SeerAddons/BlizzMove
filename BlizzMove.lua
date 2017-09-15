-- BlizzMmove, move the blizzard frames by yess
if not _G.BlizzMove then BlizzMove = {} end
local BlizzMove = _G.BlizzMove

movableFrames = {
  BankFrame,
  DressUpFrame,
  FriendsFrame,
  GameMenuFrame,
  GossipFrame,
  HelpFrame,
  InterfaceOptionsFrame,
  LootFrame,
  MailFrame,
  MerchantFrame,
  PVEFrame,
  QuestFrame,
  QuestLogPopupDetailFrame,
  RaidBrowserFrame,
  RaidBrowserFrame,
  SpellBookFrame,
  SUFWrapperFrame,
  TradeFrame,
  TradeFrame,
  VideoOptionsFrame
}

movableFramesWithhandle = {
  ["CharacterFrame"] =  { PaperDollFrame, fff, ReputationFrame, TokenFrame , PetPaperDollFrameCompanionFrame, ReputationFrame },
  ["ColorPickerFrame"] = { BlizzMove:CreateOwnHandleFrame(ColorPickerFrame, 132, 32, 117, 8, "ColorPickerFrame") },
  ["MailFrame"] = { SendMailFrame },
  ["WorldMapFrame"] = { WorldMapTitleButton },
  --["ObjectiveTrackerFrame"] = { createQuestTrackerHandle() , ObjectiveTrackerFrame.BlocksFrame.QuestHeader, ObjectiveTrackerFrame.BlocksFrame.AchievementHeader, ObjectiveTrackerFrame.BlocksFrame.ScenarioHeader},
}

movableFramesLoD = {
  ["Blizzard_AchievementUI"] = function() BlizzMove:SetMoveHandle(AchievementFrame, AchievementFrameHeader) end,
  ["Blizzard_ArchaeologyUI"] = function() BlizzMove:SetMoveHandle(ArchaeologyFrame) end,
  ["Blizzard_AuctionUI"] = function() BlizzMove:SetMoveHandle(AuctionFrame) end,
  ["Blizzard_BarbershopUI"] = function() BlizzMove:SetMoveHandle(BarberShopFrame) end,
  ["Blizzard_BindingUI"] = function() BlizzMove:SetMoveHandle(KeyBindingFrame) end,
  ["Blizzard_Calendar"] = function() BlizzMove:SetMoveHandle(CalendarFrame) end,
  ["Blizzard_Collections"] = function() BlizzMove:SetMoveHandle(CollectionsJournal); BlizzMove:SetMoveHandle(WardrobeFrame) end,
  ["Blizzard_EncounterJournal"] = function() BlizzMove:SetMoveHandle(EncounterJournal, BlizzMove:CreateOwnHandleFrame(EncounterJournal, 775, 20, 0, 0, "EncounterJournal")) end,
  ["Blizzard_GarrisonUI"] = function() BlizzMove:SetMoveHandle(GarrisonMissionFrame); BlizzMove:SetMoveHandle(GarrisonCapacitiveDisplayFrame); BlizzMove:SetMoveHandle(GarrisonLandingPage) end,
  ["Blizzard_GlyphUI"] = function() BlizzMove:SetMoveHandle(SpellBookFrame, GlyphFrame) end,
  ["Blizzard_GuildBankUI"] = function() BlizzMove:SetMoveHandle(GuildBankFrame) end,
  ["Blizzard_GuildUI"] = function() BlizzMove:SetMoveHandle(GuildFrame, GuildFrame.TitleMouseover) end,
  ["Blizzard_InspectUI"] = function() BlizzMove:SetMoveHandle(InspectFrame) end,
  ["Blizzard_ItemAlterationUI"] = function() BlizzMove:SetMoveHandle(TransmogrifyFrame) end,
  ["Blizzard_ItemSocketingUI"] = function() BlizzMove:SetMoveHandle(ItemSocketingFrame) end,
  ["Blizzard_LookingForGuildUI"] = function() BlizzMove:SetMoveHandle(LookingForGuildFrame) end,
  ["Blizzard_MacroUI"] = function() BlizzMove:SetMoveHandle(MacroFrame) end,
  ["Blizzard_OrderHallUI"] = function() BlizzMove:SetMoveHandle(OrderHallMissionFrame) end,
  ["Blizzard_ReforgingUI"] = function() BlizzMove:SetMoveHandle(ReforgingFrame, ReforgingFrameInvisibleButton) end,
  ["Blizzard_TalentUI"] = function() 	BlizzMove:SetMoveHandle(PlayerTalentFrame) end,
  ["Blizzard_TradeSkillUI"] = function() BlizzMove:SetMoveHandle(TradeSkillFrame) end,
  ["Blizzard_TrainerUI"] = function() BlizzMove:SetMoveHandle(ClassTrainerFrame) end,
  ["Blizzard_VoidStorageUI"] = function() BlizzMove:SetMoveHandle(VoidStorageFrame) end,
}

function movableFramesLoD:BlizzMove()
  for _, frame in pairs(movableFrames) do
    BlizzMove:SetMoveHandle(frame)
  end

  for frame, handles in pairs(movableFramesWithhandle) do
    for index, handle in pairs(handles) do
      BlizzMove:SetMoveHandle(_G[frame],handle)
    end
  end
end

local function ADDON_LOADED(self, event, addonName)
-- --@debug@
--   print(addonName)
-- --@end-debug@
  if movableFramesLoD[addonName] then
    movableFramesLoD[addonName]()
  end
end

local frame = CreateFrame("Frame")
frame:SetScript("OnEvent", ADDON_LOADED)
frame:RegisterEvent("ADDON_LOADED")
