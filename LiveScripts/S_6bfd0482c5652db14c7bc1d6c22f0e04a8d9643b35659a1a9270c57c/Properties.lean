import LiveScripts.Shared
import LiveScripts.S_6bfd0482c5652db14c7bc1d6c22f0e04a8d9643b35659a1a9270c57c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6bfd0482c5652db14c7bc1d6c22f0e04a8d9643b35659a1a9270c57c.script [ctx] 10000]
