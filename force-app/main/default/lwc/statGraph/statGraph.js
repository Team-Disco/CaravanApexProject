import { LightningElement } from 'lwc';

export default class StatGraph extends LightningElement {
    drawStatGraph() {
        let canvas = document.getElementById('statgraph');
        let graphCenter = [201, 201];
        let baseGraphSize = 5;

        //TEST VARIABLES
        let statList = [50, 50, 50, 50, 50]; //util, phys off, phys def, mag def, mag off
        let statNamesList = ['Utility', 'Physical Offense', 'Physical Defense', 'Magical Defense', 'Magical Offense'];
        let numStats = statList.length;
        let degreeChange = 360/numStats;
        //END TEST VARIABLES

        //TODO Make the size of the component changeable based on values passed to component

        //check if browser supports canvas feature
        if (canvas.getContext) {
            //canvas setup
            let context = canvas.getContext('2d');

            //draw stat graph outline
            context.strokeStyle = 'Grey';
            let rollingDegrees = -90;
            for (let increment = 20 + baseGraphSize; increment <= 100 + baseGraphSize; increment += 20) {
                context.beginPath();
                for(let index = 0; index < numStats; index++) {
                    //calculate x and y
                    let x = increment * Math.cos(rollingDegrees * (Math.PI/180));
                    let y = increment * Math.sin(rollingDegrees * (Math.PI/180));
    
                    context.lineTo(graphCenter[0] + x, graphCenter[1] + y);
                    if (increment == 100 + baseGraphSize) {

                        if(numStats%2 == 0) {
                            //even numstats
                            if(index == 0 || index == numStats/2) {
                                context.textAlign = 'center';
                            } else if (index < numStats/2) {
                                context.textAlign = 'start';
                            } else {
                                context.textAlign = 'end';
                            }
                        } else {
                            //odd numstats
                            if(index == 0) {
                                context.textAlign = 'center';
                            } else if (index <= numStats/2) {
                                context.textAlign = 'start';
                            } else {
                                context.textAlign = 'end';
                            }
                        }
                    	context.fillText(statNamesList[index], graphCenter[0] + (x * 1.08), graphCenter[1] + (y * 1.08));
                    }
                    
    
                    //increment rolling degrees
                    rollingDegrees += degreeChange;
                }
                
                context.closePath();
                context.stroke();
            }
            

            //draw stat graph
            context.fillStyle = '#6FD1F5B3';
            context.beginPath();
            
            rollingDegrees = -90;
            for(let index = 0; index < numStats; index++) {
                //calculate x and y
                let x = (statList[index] + baseGraphSize) * Math.cos(rollingDegrees * (Math.PI/180));
                let y = (statList[index] + baseGraphSize) * Math.sin(rollingDegrees * (Math.PI/180));

                context.lineTo(graphCenter[0] + x, graphCenter[1] + y);

                //increment rolling degrees
                rollingDegrees += degreeChange;
                console.log('Coordinates: ' + x + ', ' + y);
            }

            context.fill();
            context.closePath();
            
        } else {
            //TODO write code for when browser does not support canvas
        }
    }
}