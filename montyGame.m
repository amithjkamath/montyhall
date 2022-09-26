classdef montyGame
    
    properties
        nDoors     = [];
        actualDoor = [];
        openedDoor = [];
    end
    
    
    methods
        
        function self = montyGame(nDoors)
            self.nDoors = nDoors;
            
            % Decide which door actually has the Sports Car.
            self.actualDoor = randi(self.nDoors, 1);
        end
        
        function self = openDoor(self, selectedDoor)
        
            % Choose which door to open.
            iopenedDoor = randi(self.nDoors, 1);
            while (iopenedDoor == self.actualDoor) || (iopenedDoor == selectedDoor)
                iopenedDoor = randi(self.nDoors, 1);
            end
            self.openedDoor = iopenedDoor;
        end
        
        function revealDoor(self, switchedDoor)
            
            if switchedDoor == self.openedDoor
                fprintf("Hey, but that door was already opened. Try again!\n");
            else            
                if switchedDoor == self.actualDoor
                    fprintf("Yay - you won the car!\n");
                else
                    fprintf("Oops - you win a goat!\n");
                end
            end
        end
        
        function door = get.openedDoor(self)
            
            % Return opened door.
            if ~isempty(self.openedDoor)
                door = self.openedDoor;
            end
        end
    end
end