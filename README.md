# Log Statements Generation via Deep Learning: Widening the Support Provided to Developers

In this work, we aim to close the circle regarding supporting developers during logging activities.
In detail, starting from *LANCE*, the state-of-the-art model we presented at ICSE-22, we further improve the support offered to developers by tackling all the questions left unanswered in the previous work. To this extent, we present LEONID an extension of lance, which can (i) decide whether a given Java method would benefit from the injection of log statements (or if, instead, those are not needed); and (ii) support the injection of multiple log statements if needed, deciding how many statements are needed, where they should be placed, and what they should log. Finally, we also tried to boost the generation of meaningful log messages by combining information retrieval (IR) and DL.


#### Repositority Structure

* ##### Set up a GCS Bucket
    - Before starting with everything, you need to prepare a new GCS Bucket.
    To do so, follow the original guide provided by <a href='https://www.google.com'> Google </a> at this link: https://cloud.google.com/storage/docs/quickstart-console

* ##### Code
    - *Pre-Training*: The code we used to pre-train from scratch a new <a href="">T5 model</a> on a bigger dataset is available under this path <a href="https://github.com/antonio-mastropaolo/automating-logging-acitivities/tree/main/Code/Pre-Training">Code/Pre-Training</a>
    - *Fine-Tuning*: The code we used to fine-tune all the approaches is available at this path <a href="https://github.com/antonio-mastropaolo/automating-logging-acitivities/tree/main/Code/Fine-Tuning">Code/Fine-Tuning</a>
    - *Miscellaneous*: Such folder, contains the additional script we used to: (i) train the sentencepiece tokenizer, (ii) to select the best-performing models performing early stopping and (iii) to run the analysis described in the paper. <br> Here the link: <a href="https://github.com/antonio-mastropaolo/automating-logging-acitivities/tree/main/Code/Misc">Code/Misc</a>\
    As for the sentencepiece model, our trained tokenizer is available here: https://drive.google.com/drive/folders/1uZk5fTcsErpsRPoH8Gz-5akhqM-0eklU?usp=sharing
        

* ##### Datasets

    - All the dataset we built and used are available at this link: https://drive.google.com/drive/folders/1bKaQlcz3W_v8VJqIePPJjqT17pwdJCJ1?usp=sharing <br>
    Please note that, for each training, test and eval set, we share both the TSV file needed to train the T5-based models and also the CSV files containing additional information (e.g, className from which the method has been retrieved, log statements per methods)



* ##### Models (All the models we trained are publicly available) 
  * <a href="https://drive.google.com/drive/folders/1w7BhsOqP96EvqSc1a4N-EhDCWDbUzTpK?usp=sharing">Pre-Trained Model</a>
  * <a href="https://drive.google.com/drive/folders/1I-QmxZK7akTaJP6zzUDLFyRgZ0RZ7obg?usp=sharing">LANCE-2.0</a>
  * <a href="https://drive.google.com/drive/folders/1bu-loLCDfdoQfSrcGDKQWBcqPQ3kIp8A?usp=sharing">LEONID Single LOG</a>
  * <a href="https://drive.google.com/drive/folders/1BEdOaztfqLgXSiBTTUEU3v38AsZYBd43?usp=sharing">LEONID Multi LOG</a>
  * <a href="https://drive.google.com/drive/folders/1CHycdV-moru-oRve0nCMSc-mpUzu_gSX?usp=sharing">T5-Based Classifier</a>
  
* ##### Results:  :open_file_folder: 
    * Predictions:
      * <a href='https://drive.google.com/drive/folders/1R4ZfUcVuvHfPKd5YnLFz-Uw0dp5xzUKf?usp=sharing'>LANCE-2.0</a>
      * <a href="https://drive.google.com/drive/folders/1pvlwxEIZULqnaANrg-n_MTpZeoHMffgR?usp=sharing">LEONID Single Log</a>
      * <a href="https://drive.google.com/drive/folders/1k-DPp3sBKNZ_TjUhg5L__fWMRQ9TeuYn?usp=sharing">LEONID Multi Log</a>
      * <a href="https://drive.google.com/drive/folders/1fqtGdGu8f6rFrFWyVXQFnUpCf2phS9JQ?usp=sharing">T5-Based Classifier</a>
    * Manual Analysis:
      * <a href='https://drive.google.com/file/d/1H9wV4hIwCaL-HZID7w7QrtDHDWYpg6vH/view?usp=sharing'>LANCE-2.0</a>
      * <a href="https://drive.google.com/file/d/1d7aHPTv59SCJX_gwKKMlLW_kXWpvYJY8/view?usp=sharing">LEONID Single Log</a>


* ##### IMG:  :open_file_folder: 
    
    - <a href="https://github.com/antonio-mastropaolo/automating-logging-acitivities/tree/main/Table%26Img/LEONID-Single-Log-Examples"> Examples of semantically equivalent predictions made by LEONID when injecting single-log statements</a>
    - <a href="https://github.com/antonio-mastropaolo/automating-logging-acitivities/tree/main/Table%26Img/LEONID-Multi-Log-Examples"> Examples of correct predictions made by LEONID when injecting several log statements</a>
    

