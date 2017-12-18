library(wordcloud)
word.freq<-read.csv("word.freq.csv")
server<-function(input,output,session){
  #define a reactive expression for the document term matrix
  terms<-reactive({
    #change when the "update" buttion is pressed
    input$update
    #but not for anything else
    isolate({
      withProgress({
        setProgress(message = "Processing corpus...")
        getTermMatrix(input$selection)
      })
    })
  })
  #make the wordcloud drawing predictable during a session
  wordcould_rep<-repeatable(wordcould)
  
  output$plot<-renderPlot({
  
    wordcloud(words = word.freq$name,freq = word.freq$freq,min.freq = input$freq,
              max.words = input$max,
              random.order = F,colors = brewer.pal(8,"Dark2"))
  })
}
#shinyApp(ui = ui, server = server)
