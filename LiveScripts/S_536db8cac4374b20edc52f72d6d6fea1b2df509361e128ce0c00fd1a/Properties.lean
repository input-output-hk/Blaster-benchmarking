import LiveScripts.Shared
import LiveScripts.S_536db8cac4374b20edc52f72d6d6fea1b2df509361e128ce0c00fd1a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_536db8cac4374b20edc52f72d6d6fea1b2df509361e128ce0c00fd1a.script [ctx] 10000]
