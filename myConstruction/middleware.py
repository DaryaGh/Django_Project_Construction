from django.http import HttpResponseForbidden

# from Construction import settings
from django.conf import settings


def get_client_ip(request):
    # Get the client ip address from the request
    # IP
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        # can be a list of Ips if multiple proxies were involved

        ip = x_forwarded_for.split(',')[0].strip()
    else:
        ip = request.META.get('REMOTE_ADDR')

    return ip

    # print(ip)
    # print(request.META)


class AdminIpRestrictionMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        if request.path.startswith('/admin/'):

            client_ip = get_client_ip(request)

            # list of allowed ips (you can also put this in settings.py)
            allowed_ips = getattr(settings, 'ALLOWED_ADMIN_IPS', [])

            # if the ip is not in the allowed list , deny access
            if client_ip not in allowed_ips:
                return HttpResponseForbidden('Access To Admin panel is restricted')
        # next
        return self.get_response(request)
