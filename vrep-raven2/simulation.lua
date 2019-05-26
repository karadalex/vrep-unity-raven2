-- if you wish to execute code contained in an external file instead,
-- use the require-directive, e.g.:
--
-- require 'myExternalFile'
--
-- Above will look for <V-REP executable path>/myExternalFile.lua or
-- <V-REP executable path>/lua/myExternalFile.lua
-- (the file can be opened in this editor with the popup menu over
-- the file name)

-- Set global variables (signals)
rightArmHandles = {-1,-1,-1,-1,-1,-1}
rightArmHandles[1] = sim.getObjectHandle('shoulder_R')
rightArmHandles[2] = sim.getObjectHandle('elbow_R')
rightArmHandles[3] = sim.getObjectHandle('insertion_R')
rightArmHandles[4] = sim.getObjectHandle('tool_roll_R')
rightArmHandles[5] = sim.getObjectHandle('wrist_joint_R')
rightArmHandles[6] = sim.getObjectHandle('grasper_joint_1_R')
sim.setStringSignal("rightArmHandles", sim.packTable(rightArmHandles))

-- rightArmHandles in table form
rightArmHandlesTable = {-1,-1,-1,-1,-1,-1}
rightArmHandlesTable['shoulder_R'] = sim.getObjectHandle('shoulder_R')
rightArmHandlesTable['elbow_R'] = sim.getObjectHandle('elbow_R')
rightArmHandlesTable['insertion_R'] = sim.getObjectHandle('insertion_R')
rightArmHandlesTable['tool_roll_R'] = sim.getObjectHandle('tool_roll_R')
rightArmHandlesTable['wrist_joint_R'] = sim.getObjectHandle('wrist_joint_R')
rightArmHandlesTable['grasper_joint_1_R'] = sim.getObjectHandle('grasper_joint_1_R')
sim.setStringSignal("rightArmHandlesTable", sim.packTable(rightArmHandlesTable))

leftArmHandles = {-1,-1,-1,-1,-1,-1}
leftArmHandles[1] = sim.getObjectHandle('shoulder_L')
leftArmHandles[2] = sim.getObjectHandle('elbow_L')
leftArmHandles[3] = sim.getObjectHandle('insertion_L')
leftArmHandles[4] = sim.getObjectHandle('tool_roll_L')
leftArmHandles[5] = sim.getObjectHandle('wrist_joint_L')
leftArmHandles[6] = sim.getObjectHandle('grasper_joint_1_L')
sim.setStringSignal("leftArmHandles", sim.packTable(leftArmHandles))

-- leftArmHandles in table form
leftArmHandlesTable = {-1,-1,-1,-1,-1,-1}
leftArmHandlesTable['shoulder_L'] = sim.getObjectHandle('shoulder_L')
leftArmHandlesTable['elbow_L'] = sim.getObjectHandle('elbow_L')
leftArmHandlesTable['insertion_L'] = sim.getObjectHandle('insertion_L')
leftArmHandlesTable['tool_roll_L'] = sim.getObjectHandle('tool_roll_L')
leftArmHandlesTable['wrist_joint_L'] = sim.getObjectHandle('wrist_joint_L')
leftArmHandlesTable['grasper_joint_1_L'] = sim.getObjectHandle('grasper_joint_1_L')
sim.setStringSignal("leftArmHandlesTable", sim.packTable(leftArmHandlesTable))

jointNames = {
    left = {
        'shoulder_L', 'elbow_L', 'insertion_L', 'tool_roll_L', 'wrist_joint_L', 'grasper_joint_1_L'
    },
    right = {
        'shoulder_R', 'elbow_R', 'insertion_R', 'tool_roll_R', 'wrist_joint_R', 'grasper_joint_1_R'
    }
}
sim.setStringSignal("jointNames", sim.packTable(jointNames))


function sysCall_init()
    -- Initialization code:
    
    
end

function sysCall_actuation()
    -- put your actuation code here
    --
    -- For example:
    --
    -- local position=sim.getObjectPosition(handle,-1)
    -- position[1]=position[1]+0.001
    -- sim.setObjectPosition(handle,-1,position)
end

function sysCall_sensing()
    -- put your sensing code here
end

function sysCall_cleanup()
    -- do some clean-up here
end

-- You can define additional system calls here:
--[[
function sysCall_suspend()
end

function sysCall_resume()
end

function sysCall_dynCallback(inData)
end

function sysCall_jointCallback(inData)
    return outData
end

function sysCall_contactCallback(inData)
    return outData
end

function sysCall_beforeCopy(inData)
    for key,value in pairs(inData.objectHandles) do
        print("Object with handle "..key.." will be copied")
    end
end

function sysCall_afterCopy(inData)
    for key,value in pairs(inData.objectHandles) do
        print("Object with handle "..key.." was copied")
    end
end

function sysCall_beforeDelete(inData)
    for key,value in pairs(inData.objectHandles) do
        print("Object with handle "..key.." will be deleted")
    end
    -- inData.allObjects indicates if all objects in the scene will be deleted
end

function sysCall_afterDelete(inData)
    for key,value in pairs(inData.objectHandles) do
        print("Object with handle "..key.." was deleted")
    end
    -- inData.allObjects indicates if all objects in the scene were deleted
end

function sysCall_afterCreate(inData)
    for key,value in pairs(inData.objectHandles) do
        print("Object with handle "..value.." was created")
    end
end
--]]
