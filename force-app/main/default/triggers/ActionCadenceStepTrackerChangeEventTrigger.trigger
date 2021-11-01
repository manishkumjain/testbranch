/*
 * @date        : 22-07-2021
 * @author      : 
 * @description : Trigger for ActionCadenceStepTrackerChangeEvent
 * @history     : Version 1.0
 */
trigger ActionCadenceStepTrackerChangeEventTrigger on ActionCadenceStepTrackerChangeEvent (after insert) {
    ActionCadenceStepTrackChanEvtTrgrHandler handler = new ActionCadenceStepTrackChanEvtTrgrHandler();
    handler.RemoveCadenceOnStepCompletion(Trigger.new);
    //System.debug('Received change event forAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ' );
	
}