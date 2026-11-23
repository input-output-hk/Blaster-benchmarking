import LiveScripts.Shared
import LiveScripts.S_82fe3999d4d6aa76aedf953d2d05862b958a9bdfe76a248f682def9a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_82fe3999d4d6aa76aedf953d2d05862b958a9bdfe76a248f682def9a.script [ctx] 10000]
