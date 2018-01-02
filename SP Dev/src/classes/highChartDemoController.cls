public class highChartDemoController{
    @RemoteAction
    public static HighChartDataWrapper getDataForChart(){    
        AggregateResult[] groupedResults = [select  stageName sn ,COUNT(id) st from Opportunity where stageName !=null Group By stageName];
        HighChartDataWrapper dataForChart = new HighChartDataWrapper();
        for (AggregateResult ar : groupedResults){
            system.debug('********ar:'+ar);
            integer count=integer.valueof((ar.get('st'))); 
            string stage= (string)ar.get('sn');
            dataForChart.chartLabels.add(stage);
            dataForChart.chartData.add(count);
            
        }
        system.debug('******dataForChart:'+dataForChart);
        return dataForChart ;
    }
    public class HighChartDataWrapper{
       public List<String> chartLabels {get;set;}  //this will opportunity stage
       public List<Integer> chartData {get;set;}   //no.of opportunities
       public HighChartDataWrapper(){
            chartLabels = new List<String>();
            chartData = new List<Integer>();
            
        }
    }
}