
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract ArrayManipulation {
    using SafeMath for uint256;

    uint256[] public dataArray;

    constructor(uint256[] memory initialData) {
        dataArray = initialData;
    }

    function sortArray() external {
        bubbleSort();
    }

    function removeDuplicatesFromArray() external {
        uint256[] memory uniqueArray = new uint256[](dataArray.length);
        uint256 uniqueCount = 0;

        for (uint256 i = 0; i < dataArray.length; i++) {
            if (!contains(uniqueArray, uniqueCount, dataArray[i])) {
                uniqueArray[uniqueCount] = dataArray[i];
                uniqueCount = uniqueCount.add(1);
            }
        }

        // Resizing the dataArray to match the number of unique elements.
        dataArray = new uint256[](uniqueCount);
        for (uint256 i = 0; i < uniqueCount; i++) {
            dataArray[i] = uniqueArray[i];
        }
    }

    function getDataArray() external view returns (uint256[] memory) {
        return dataArray;
    }

    function bubbleSort() internal {
        uint256 n = dataArray.length;
        bool swapped;
        do {
            swapped = false;
            for (uint256 i = 1; i < n; i++) {
                if (dataArray[i - 1] > dataArray[i]) {
                    (dataArray[i - 1], dataArray[i]) = (dataArray[i], dataArray[i - 1]);
                    swapped = true;
                }
            }
        } while (swapped);
    }

    function contains(uint256[] memory arr, uint256 length, uint256 value) internal pure returns (bool) {
        for (uint256 i = 0; i < length; i++) {
            if (arr[i] == value) {
                return true;
            }
        }
        return false;
    }
}
