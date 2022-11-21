from django.db import models

# Create your models here.
class Candidate(models.Model):
    name = models.CharField(max_length=10)
    introduction = models.TextField() 
    area = models.CharField(max_length=15)
    party_number = models.IntegerField(default=1)
    
    def __str__(self):
        return self.name
    
class Career(models.Model):
    candi = models.ForeignKey(Candidate,on_delete=models.CASCADE)
    start_date = models.DateField()
    end_date = models.DateField()
    careerTitle = models.CharField(max_length=100)
    
    def __str__(self):
        return str(self.candi)+':'+self.careerTitle
    
    
    