#!/usr/bin/env node
import 'source-map-support/register';
import * as cdk from 'aws-cdk-lib';
import { PersonalWebSiteStack } from '../lib/personal-web-site-stack';

const app = new cdk.App();
new PersonalWebSiteStack(app, 'PersonalWebSiteStack', {});