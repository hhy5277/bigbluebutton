package org.bigbluebutton.air.settings {
	
	import org.bigbluebutton.air.settings.views.SettingsViewMediatorAIR;
	import org.bigbluebutton.air.settings.views.TopToolbarMediatorSettings;
	import org.bigbluebutton.air.settings.views.TopToolbarSettings;
	import org.bigbluebutton.lib.main.views.TopToolbarBase;
	import org.bigbluebutton.lib.settings.views.SettingsViewBase;
	
	import robotlegs.bender.extensions.matching.TypeMatcher;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	
	public class SettingsConfig implements IConfig {
		
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		[Inject]
		public var signalCommandMap:ISignalCommandMap;
		
		public function configure():void {
			mediators();
		}
		
		/**
		 * Maps view mediators to views.
		 */
		private function mediators():void {
			mediatorMap.map(SettingsViewBase).toMediator(SettingsViewMediatorAIR);
			mediatorMap.mapMatcher(new TypeMatcher().allOf(TopToolbarBase, TopToolbarSettings)).toMediator(TopToolbarMediatorSettings);
		}
	}
}
