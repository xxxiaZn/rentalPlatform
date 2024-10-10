from rest_framework.decorators import api_view, authentication_classes

from myapp.auth.authentication import AdminTokenAuthtication
from myapp.handler import APIResponse
from myapp.models import Fankuicontent
from myapp.permission.permission import isDemoAdminUser
from myapp.serializers import FankuicontentSerializer


@api_view(['GET'])
def list_api(request):
    if request.method == 'GET':
        tags = Fankuicontent.objects.all().order_by('-id')
        serializer = FankuicontentSerializer(tags, many=True)
        return APIResponse(code=0, msg='查询成功', data=serializer.data)
