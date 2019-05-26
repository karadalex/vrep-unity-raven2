-- if you wish to execute code contained in an external file instead,
-- use the require-directive, e.g.:
--
-- require 'myExternalFile'
--
-- Above will look for <V-REP executable path>/myExternalFile.lua or
-- <V-REP executable path>/lua/myExternalFile.lua
-- (the file can be opened in this editor with the popup menu over
-- the file name)

function sysCall_init()
    -- The child script initialization
    objectHandle = sim.getObjectAssociatedWithScript(sim.handle_self)
    objectName = sim.getObjectName(objectHandle)
    print(sim.getStringSignal("jointNames"))
    jointNames = sim.unpackTable(sim.getStringSignal("jointNames"))
    leftArmHandlesTable = sim.unpackTable(sim.getStringSignal("leftArmHandlesTable"))
    rightArmHandlesTable = sim.unpackTable(sim.getStringSignal("rightArmHandlesTable"))

    -- Check if the required RosInterface is there:
    moduleName = 0
    index = 0
    rosInterfacePresent = false
    while moduleName do
        moduleName = sim.getModuleName(index)
        if (moduleName == 'RosInterface') then
            rosInterfacePresent = true
        end
        index = index + 1
    end

    sequenceId = 0
    -- Prepare the float32 publisher and subscriber (we subscribe to the topic we advertise):
    if rosInterfacePresent then
        jointStatesPublisher = simROS.advertise('/joint_states','sensor_msgs/JointState')
    end
end

function headerMsg(frameId)
    sequenceId = sequenceId + 1
    return {
        seq = sequenceId,
        stamp = sim.getSystemTime(),
        frame_id = frameId
    }
end

function jointStatesMsg()
    local i = 1
    names = {}
    positions = {}
    velocities = {}
    efforts = {}
    for k, jointName in pairs(jointNames['left']) do
        names[i] = jointName
        positions[i] = sim.getJointPosition(leftArmHandlesTable[jointName])
        -- sim.jointfloatparam_velocity (2012): float parameter (can only be read) : joint velocity. This is a calculated value.
        velocities[i] = sim.getObjectFloatParameter(leftArmHandlesTable[jointName], 2012)
        efforts[i] = sim.getJointForce(leftArmHandlesTable[jointName])
        i = i+1
    end
    for k, jointName in pairs(jointNames['right']) do
        names[i] = jointName
        positions[i] = sim.getJointPosition(rightArmHandlesTable[jointName])
        -- sim.jointfloatparam_velocity (2012): float parameter (can only be read) : joint velocity. This is a calculated value.
        velocities[i] = sim.getObjectFloatParameter(rightArmHandlesTable[jointName], 2012)
        efforts[i] = sim.getJointForce(rightArmHandlesTable[jointName])
        i = i+1
    end
    return {
        header = headerMsg("world"),
        name = names,
        position = positions,
        velocity = velocities,
        effort = efforts
        
    }
    -- return {
    --     header = headerMsg("world"),
    --     name = {
    --         "elbow_L"
    --     },
    --     position = {sim.getJointPosition(leftArmHandles[1])},
    --     -- sim.jointfloatparam_velocity (2012): float parameter (can only be read) : joint velocity. This is a calculated value.
    --     velocity = {sim.getObjectFloatParameter(leftArmHandles[1], 2012)},
    --     effort = {sim.getJointForce(leftArmHandles[1])}
        
    -- }
    
end

function sysCall_actuation()
    if rosInterfacePresent then
        simROS.publish(jointStatesPublisher, jointStatesMsg())
        -- To send several transforms at once, use simROS.sendTransforms instead
    end
end

function sysCall_cleanup()
    -- Following not really needed in a simulation script (i.e. automatically shut down at simulation end):
    if rosInterfacePresent then
        simROS.shutdownPublisher(jointStatesPublisher)
    end
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
