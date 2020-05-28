"""
Unit tests for simple Python application
"""

import promotion
import pytest
from webtest import TestApp
import cx_Oracle


class TestPromotion:

    def test_addition(self):
        assert '1200' == promotion.addition(1150, 50)

    def test_decrease(self):
        assert '970' == promotion.decrease(1150, 180)

    def test_increment(self):
        assert '1250.0' == promotion.increment(1000, 25)


@pytest.fixture
def application():
    test_app = TestApp(promotion.app)
    return test_app


def test_response_shold_be_ok(application):
    response = application.get('/addition/1000/200')
    assert response.status == "200 OK"


def test_addition(application):
    response = application.get('/addition/1000/200')
    assert b'1200' == response.body


@pytest.fixture(scope='session')
def test_connection():
    DBUSER = 'hr'
    DBPASS = 'WelCom3#2020_'
    DBHOST = 'blk-host.sub05261508050.blkvcn.oraclevcn.com'
    DBSERV = 'pdb01.sub05261508050.blkvcn.oraclevcn.com'
    conn_string = DBUSER + '/' + DBPASS + '@//' + DBHOST + '/' + DBSERV
    connection = cx_Oracle.connect(conn_string)
    response = connection.version
    assert response == '19.7.0.0.0'
    connection.close()
