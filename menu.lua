-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- include Corona's "widget" library
local widget = require "widget"

local gameSettings = require "gameSettings"

--------------------------------------------

-- forward declarations and other locals
local playBtn, btnPlayNote, btnPlayChord, btnHighScores, btnSettings, btnHelp

-- Button OnRelease Functions
local function onbtnPlayNoteRelease(event)
    if (event.phase == "release") then
        gameSettings.gameType = "Note";
        storyboard.gotoScene("game", "slideLeft", 300);
        return true;
    end
end

local function onbtnPlayChordRelease(event)
    if (event.phase == "release") then
        gameSettings.gameType = "Chord";
        storyboard.gotoScene("game", "slideLeft", 300);
        return true;
    end
end

local function onbtnHighScoresRelease(event)
    if (event.phase == "release") then
        storyboard.gotoScene("highScores", "slideLeft", 300);
        return true;
    end
end

local function onbtnSettingsRelease(event)
    if (event.phase == "release") then
        storyboard.gotoScene("settings", "slideLeft", 300);
        return true;
    end
end

local function onbtnHelpRelease(event)
    if (event.phase == "release") then
        storyboard.gotoScene("help", "slideLeft", 300);
        return true;
    end
end

-----------------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
-- 
-- NOTE: Code outside of listener functions (below) will only be executed once,
--		 unless storyboard.removeScene() is called.
-- 
-----------------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-- display a background image
	local background = display.newImageRect( "images/vertBg.jpg", 334, 480 )
	background:setReferencePoint( display.TopLeftReferencePoint )
	background.x, background.y = 0, 0
	
	-- create/position logo/title image on upper-half of the screen
	local titleLogo = display.newImageRect( "images/logo.png", 244, 34 )
	titleLogo:setReferencePoint( display.CenterReferencePoint )
	titleLogo.x = display.contentWidth * 0.5
	titleLogo.y = 40
	
	-- create a widget button (which will loads game.lua on release)
	btnPlayNote = widget.newButton{
		label="Name That Note",
		labelColor = { default={255}, over={128} },
		default="button.png",
		over="button-over.png",
		width=154, height=40,
		onRelease = onbtnPlayNoteRelease	-- event listener function
	}
    btnPlayNote:setReferencePoint( display.CenterReferencePoint )
    btnPlayNote.x = display.contentWidth*0.5
    btnPlayNote.y = 100

    -- create a widget button (which will loads game.lua on release)
    btnPlayChord = widget.newButton{
        label="Name that Chord",
        labelColor = { default={255}, over={128} },
        default="button.png",
        over="button-over.png",
        width=154, height=40,
        onRelease = onbtnPlayChordRelease	-- event listener function
    }
    btnPlayChord:setReferencePoint( display.CenterReferencePoint )
    btnPlayChord.x = display.contentWidth*0.5
    btnPlayChord.y = 175

    -- create a widget button (which will loads game.lua on release)
    btnHighScores = widget.newButton{
        label="High Scores",
        labelColor = { default={255}, over={128} },
        default="button.png",
        over="button-over.png",
        width=154, height=40,
        onRelease = onbtnHighScoresRelease	-- event listener function
    }
    btnHighScores:setReferencePoint( display.CenterReferencePoint )
    btnHighScores.x = display.contentWidth*0.5
    btnHighScores.y = 250

    -- create a widget button (which will loads game.lua on release)
    btnSettings = widget.newButton{
        label="Settings",
        labelColor = { default={255}, over={128} },
        default="button.png",
        over="button-over.png",
        width=154, height=40,
        onRelease = onbtnSettingsRelease	-- event listener function
    }
    btnSettings:setReferencePoint( display.CenterReferencePoint )
    btnSettings.x = display.contentWidth*0.5
    btnSettings.y = 325

    -- create a widget button (which will loads game.lua on release)
    btnHelp = widget.newButton{
        label="Help",
        labelColor = { default={255}, over={128} },
        default="button.png",
        over="button-over.png",
        width=154, height=40,
        onRelease = onbtnHelpRelease	-- event listener function
    }
    btnHelp:setReferencePoint( display.CenterReferencePoint )
    btnHelp.x = display.contentWidth*0.5
    btnHelp.y = 400
	
	-- all display objects must be inserted into group
	group:insert( background )
	group:insert( titleLogo )
	group:insert( btnPlayNote )
    group:insert( btnPlayChord )
    group:insert( btnHighScores )
    group:insert( btnSettings )
    group:insert( btnHelp )
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	-- INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	-- INSERT code here (e.g. stop timers, remove listenets, unload sounds, etc.)
	
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
	local group = self.view
	
	if playBtn then
		playBtn:removeSelf()	-- widgets must be manually removed
		playBtn = nil
	end
end

-----------------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
-----------------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched whenever before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

-----------------------------------------------------------------------------------------

return scene