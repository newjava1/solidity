/*
	This file is part of solidity.

	solidity is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	solidity is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with solidity.  If not, see <http://www.gnu.org/licenses/>.
*/
// SPDX-License-Identifier: GPL-3.0
#pragma once

#include <libyul/optimiser/Metrics.h>
#include <libyul/optimiser/NameDispenser.h>
#include <libyul/AST.h>
#include <libyul/Dialect.h>
#include <libyul/Exceptions.h>

#include <liblangutil/SourceLocation.h>

#include <libsolutil/CommonData.h>

#include <variant>

namespace solidity::yul::unusedFunctionsCommon
{

template<typename T>
std::vector<T> filter(std::vector<T> const& _vec, std::vector<bool> const& _mask)
{
	yulAssert(_vec.size() == _mask.size(), "");

	std::vector<T> ret;

	for (size_t i = 0; i < _mask.size(); ++i)
		if (_mask[i])
			ret.push_back(_vec[i]);

	return ret;
}

/// Returns true if applying UnusedFunctionParameterPruner is not helpful or redundant because the
/// inliner will be able to handle it anyway.
inline bool tooSimpleToBePruned(FunctionDefinition const& _f)
{
	return _f.body.statements.size() <= 1 && CodeSize::codeSize(_f.body) <= 1;
}

FunctionDefinition createLinkingFunction(
	FunctionDefinition const& _original,
	std::pair<std::vector<bool>, std::vector<bool>> const& _usedParametersAndReturns,
	YulString const& _originalFunctionName,
	YulString const& _linkingFunctionName,
	NameDispenser& _nameDispenser
);

}
