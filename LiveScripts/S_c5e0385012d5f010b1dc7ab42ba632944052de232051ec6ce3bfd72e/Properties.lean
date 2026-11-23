import LiveScripts.Shared
import LiveScripts.S_c5e0385012d5f010b1dc7ab42ba632944052de232051ec6ce3bfd72e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c5e0385012d5f010b1dc7ab42ba632944052de232051ec6ce3bfd72e.script [datum, redeemer, ctx] 10000]
