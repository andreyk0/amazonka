{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}

-- Module      : Network.AWS.CloudWatch.V2010_08_01.DescribeAlarmHistory
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Retrieves history for the specified alarm. Filter alarms by date range or
-- item type. If an alarm name is not specified, Amazon CloudWatch returns
-- histories for all of the owner's alarms. Amazon CloudWatch retains the
-- history of an alarm for two weeks, whether or not you delete the alarm.
module Network.AWS.CloudWatch.V2010_08_01.DescribeAlarmHistory where

import Control.Lens
import Network.AWS.Request.Query
import Network.AWS.CloudWatch.V2010_08_01.Types
import Network.AWS.Prelude

-- | Minimum specification for a 'DescribeAlarmHistory' request.
describeAlarmHistory :: DescribeAlarmHistory
describeAlarmHistory = DescribeAlarmHistory
    { _dahiAlarmName = Nothing
    , _dahiHistoryItemType = Nothing
    , _dahiMaxRecords = Nothing
    , _dahiNextToken = Nothing
    , _dahiEndDate = Nothing
    , _dahiStartDate = Nothing
    }

data DescribeAlarmHistory = DescribeAlarmHistory
    { _dahiAlarmName :: Maybe Text
      -- ^ The name of the alarm.
    , _dahiHistoryItemType :: Maybe HistoryItemType
      -- ^ The type of alarm histories to retrieve.
    , _dahiMaxRecords :: Maybe Integer
      -- ^ The maximum number of alarm history records to retrieve.
    , _dahiNextToken :: Maybe Text
      -- ^ The token returned by a previous call to indicate that there is
      -- more data available.
    , _dahiEndDate :: Maybe ISO8601
      -- ^ The ending date to retrieve alarm history.
    , _dahiStartDate :: Maybe ISO8601
      -- ^ The starting date to retrieve alarm history.
    } deriving (Generic)

makeLenses ''DescribeAlarmHistory

instance ToQuery DescribeAlarmHistory where
    toQuery = genericToQuery def

data DescribeAlarmHistoryResponse = DescribeAlarmHistoryResponse
    { _dahoAlarmHistoryItems :: [AlarmHistoryItem]
      -- ^ A list of alarm histories in JSON format.
    , _dahoNextToken :: Maybe Text
      -- ^ A string that marks the start of the next batch of returned
      -- results.
    } deriving (Generic)

makeLenses ''DescribeAlarmHistoryResponse

instance FromXML DescribeAlarmHistoryResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest DescribeAlarmHistory where
    type Sv DescribeAlarmHistory = CloudWatch
    type Rs DescribeAlarmHistory = DescribeAlarmHistoryResponse

    request = post "DescribeAlarmHistory"
    response _ = xmlResponse

instance AWSPager DescribeAlarmHistory where
    next rq rs = (\x -> rq { Keyed "_dahiNextToken" = Just x })
        <$> (Keyed "_dahoNextToken" rs)
