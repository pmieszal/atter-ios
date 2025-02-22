//
//  EventEditConfigurator.swift
//  Atter
//
//  Created by Patryk Mieszała on 19/07/2019.
//  Copyright © 2019 Patryk Mieszała. All rights reserved.
//

import UIKit
import atter_logic

final class EventEditConfigurator {
    func configureNewEventModule(event: Event?) -> EventEditViewController? {
        guard let viewController: EventEditViewController = R.storyboard.eventEdit.eventEditViewController() else {
            return nil
        }
        let router: EventEditRouter = EventEditRouter(viewController: viewController)
        let viewModel: EventEditViewModel = EventEditViewModel.Companion().instance(presenter: viewController, event: event)
        
        viewController.router = router
        viewController.viewModel = viewModel
        
        return viewController
    }
}
