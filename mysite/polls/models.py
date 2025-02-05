from django.db import models

# Create your models here.
class Question(models.Model):
    #id는 자동으로 생성 (primary key)
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')
    
    #객체표현양식 
    def __str__(self):
        return self.question_text 
    
class Choice(models.Model):
    question = models.ForeignKey(Question,on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)  
    
    def __str__(self):
        return self.choice_text 
    
