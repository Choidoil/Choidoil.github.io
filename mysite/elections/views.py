from django.shortcuts import render
from .models import Candidate,Career
# Create your views here.
def index(request):
    candidates = Candidate.objects.all()
    careers = Career.objects.all()
    context = {'candidates':candidates,'careers':careers}
    return render(request,'elections/index.html',context)
#     str = '' 
#     for x in candidates:
#         str += "<p>{} 기호 {} 번({})".format(x.name,x.party_number,x.area)
#         str += x.introduction +"</p>"
#         
#     return HttpResponse("선거사이트 입니다. Hello World<br>"+str)