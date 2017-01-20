

## legendItemClick
legendItemClick <- "#! 
  function() {  
    var Series = this.chart.series;  
    if (!this.visible) {
      for (var i = 0; i < Series.length; i++) {
        if (Series[i].userOptions.name == this.userOptions.name) Series[i].show();    
      };  
    } else {    
      for (var i = 0; i < Series.length; i++) {      
        if (Series[i].index != this.index && Series[i].userOptions.name != this.userOptions.name) {
          Series[i].visible ? Series[i].hide() : Series[i].show();      
        };    
      };  
    };  
    return false; 
} !#"



## setExtremes;
setExtremes <- "#! 
  function(event) {  
    if (event.max) {    
      var f = Math.ceil((event.max - event.min)/30);    
      this.options.labels.step = f;  
    } else {  
      var max = this.chart.xAxis[0].dataMax
      var min = this.chart.xAxis[0].dataMin
      var f = Math.ceil((max - min)/30);    
      this.options.labels.step = f;  
    };
} !#"

setExtremes_D <- "#! 
  function(event) {  
    if (event.max) {    
      var f = Math.ceil((event.max - event.min)/10/1/24/36e5);    
      this.options.labels.step = f;  
    } else {  
      var max = this.chart.xAxis[0].dataMax
      var min = this.chart.xAxis[0].dataMin
      var f = Math.ceil((max - min)/10/1/24/36e5);    
      this.options.labels.step = f;  
    };
} !#"

setExtremes_W <- "#! 
  function(event) {  
    if (event.max) {    
      var f = Math.ceil((event.max - event.min)/10/7/24/36e5);    
      this.options.labels.step = f;  
    } else {  
      var max = this.chart.xAxis[0].dataMax
      var min = this.chart.xAxis[0].dataMin
      var f = Math.ceil((max - min)/10/7/24/36e5);    
      this.options.labels.step = f;  
    };
} !#"

setExtremes_M <- "#! 
  function(event) {  
    if (event.max) {    
      var f = Math.ceil((event.max - event.min)/10/30/24/36e5);    
      this.options.labels.step = f;  
    } else {  
      var max = this.chart.xAxis[0].dataMax
      var min = this.chart.xAxis[0].dataMin
      var f = Math.ceil((max - min)/10/30/24/36e5);    
      this.options.labels.step = f;  
    };
} !#"


