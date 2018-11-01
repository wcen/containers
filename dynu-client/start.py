import os
import requests
import logging
import json
from time import sleep

""" Get environment """
GET_IP_SERVER = os.environ.get ('GET_IP_SERVER')
DYNU_API_SERVER = os.environ.get ('DYNU_API_SERVER')
DYNU_API_KEY = os.environ.get ('DYNU_API_KEY')
DYNU_DOMAIN = os.environ.get ('DYNU_DOMAIN')
WAIT_TIME = int(os.environ.get ('WAIT_TIME'))


def get_dynu_domain_info(domain_name):
    func_name = get_dynu_domain_info.__name__
    headers = { "accept": "application/json", "API-Key": DYNU_API_KEY }
    url = "{}/dns".format(DYNU_API_SERVER)
    resp = requests.get (url, headers=headers)
    if resp.status_code == 200:
        for domain in resp.json()['domains']:
            if domain['name'] == domain_name:
                return domain
        logger.error ("{}(): domain '{}' not found".format(func_name, domain_name))
        return None
    else:
        logger.error ("{}(): get domain '{}' id failed".format(func_name, domain_name))
        return False


def update_dynu_domain(domain_info, ip_address):
    func_name = update_dynu_domain.__name__
    domain_id = domain_info['id']
    domain_name = domain_info['name']
    current_ip = domain_info['ipv4Address']
    headers = { "accept": "application/json", "API-Key": DYNU_API_KEY }
    url = "{}/dns/{}".format(DYNU_API_SERVER, domain_id)
    
    if current_ip == ip_address:
        logger.info ("{}(): ip not change, skip update ip address".format(func_name))
    else:
        domain_info['ipv4Address'] = ip_address
        body = domain_info
        resp = requests.post (url, headers=headers, json=body)
        if resp.status_code == 200:
            logger.info ("{}(): update domain '{}' ip to '{}' success".format(func_name, domain_name, ip_address))
            return True
        else:
            logger.error ("{}(): update domain '{}' ip to '{}' failed".format(func_name, domain_name, ip_address))
            return False


def main():
    logger.info ("dynu domain name: {}".format(DYNU_DOMAIN))
    resp = requests.get (GET_IP_SERVER)
    if resp.status_code == 200:
        current_ip = resp.text
        logger.info ("current ip: {}".format(current_ip))
        domain_info = get_dynu_domain_info(DYNU_DOMAIN)
        if domain_info is not None and domain_info is not False:
            update_dynu_domain(domain_info, current_ip)
    else:
        logger.error ("can't get current ip from '{}'".format(GET_IP_SERVER))


if __name__ == "__main__":
    """ Setting logging """
    logFormatter = logging.Formatter("[%(asctime)s] [%(levelname)s]   %(message)s")
    logger = logging.getLogger(__name__)
    logger.setLevel(logging.DEBUG)

    consoleHandler = logging.StreamHandler()
    consoleHandler.setFormatter(logFormatter)
    logger.addHandler(consoleHandler)

    while True:
        main()
        sleep (WAIT_TIME)
